#!/bin/bash
# OBIX Import Structure Validation Script
# Validates @obix/* import patterns and module boundary compliance
# Project: Aegis - OBIX Framework
# Methodology: Waterfall Development with Systematic Validation

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly SRC_DIR="$PROJECT_ROOT/src"
readonly LOG_FILE="$PROJECT_ROOT/import-validation-$(date +%Y%m%d-%H%M%S).log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

error() {
    echo "[ERROR] $*" >&2
    exit 1
}

# Validate OBIX import structure compliance
validate_import_patterns() {
    log "Validating OBIX import structure..."
    
    local validation_errors=0
    local total_files=0
    local compliant_files=0
    
    # Find all TypeScript files
    while IFS= read -r -d '' file; do
        ((total_files++))
        
        # Check for invalid relative imports across module boundaries
        if grep -q "import.*from.*\.\./\.\." "$file" 2>/dev/null; then
            log "⚠️  Invalid relative import in: $file"
            grep -n "import.*from.*\.\./\.\." "$file" | while read -r line; do
                log "    Line: $line"
            done
            ((validation_errors++))
        else
            ((compliant_files++))
        fi
        
    done < <(find "$SRC_DIR" -name "*.ts" -type f -print0)
    
    log "Import validation summary:"
    log "  Total files: $total_files"
    log "  Compliant files: $compliant_files"
    log "  Files with violations: $validation_errors"
    
    if [ "$validation_errors" -eq 0 ]; then
        log "✅ All imports follow proper module boundaries"
        return 0
    else
        log "❌ Import structure validation failed with $validation_errors violations"
        return 1
    fi
}

# Validate @obix/* alias usage
validate_internal_aliases() {
    log "Checking internal alias usage..."
    
    local internal_imports=0
    local total_imports=0
    
    # Count files using internal aliases
    internal_imports=$(find "$SRC_DIR" -name "*.ts" -type f -exec grep -l "from '@obix" {} \; 2>/dev/null | wc -l)
    total_imports=$(find "$SRC_DIR" -name "*.ts" -type f -exec grep -l "import.*from" {} \; 2>/dev/null | wc -l)
    
    if [ "$total_imports" -gt 0 ]; then
        local adoption_rate=$(( internal_imports * 100 / total_imports ))
        log "Internal alias adoption: $adoption_rate% ($internal_imports/$total_imports files)"
        
        if [ "$adoption_rate" -lt 50 ]; then
            log "⚠️  Low internal alias adoption rate"
            return 1
        fi
    fi
    
    return 0
}

# Check for circular dependencies
validate_circular_dependencies() {
    log "Checking for circular dependencies..."
    
    # Simple circular dependency detection
    local circular_deps=0
    
    # Check for potential circular imports within core modules
    find "$SRC_DIR/core" -name "*.ts" -type f | while read -r file; do
        local module_path=$(dirname "$file" | sed "s|$SRC_DIR/||")
        
        # Check if file imports from modules that might import it back
        if grep -q "from.*core/" "$file" 2>/dev/null; then
            local imported_modules=$(grep "from.*core/" "$file" | sed -n "s/.*from ['\"]\.\.\/\([^'\"]*\)['\"].*/\1/p")
            if [ -n "$imported_modules" ]; then
                log "Potential circular dependency in: $file"
                ((circular_deps++))
            fi
        fi
    done
    
    if [ "$circular_deps" -eq 0 ]; then
        log "✅ No circular dependencies detected"
        return 0
    else
        log "⚠️  Potential circular dependencies found: $circular_deps"
        return 1
    fi
}

# Main validation process
main() {
    log "Starting OBIX import structure validation..."
    
    local validation_status=0
    
    # Run validation checks
    if ! validate_import_patterns; then
        validation_status=1
    fi
    
    if ! validate_internal_aliases; then
        validation_status=1
    fi
    
    if ! validate_circular_dependencies; then
        validation_status=1
    fi
    
    if [ "$validation_status" -eq 0 ]; then
        log "✅ OBIX import structure validation completed successfully"
    else
        log "❌ Import structure validation failed - see issues above"
        exit 1
    fi
}

# Execute with error handling
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
