#!/bin/bash
# OBIX Import Structure Validation Script
# Validates @obix/* import patterns and module boundary compliance

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly SRC_DIR="$PROJECT_ROOT/src"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
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

# Main validation process
main() {
    log "Starting OBIX import structure validation..."
    
    if validate_import_patterns; then
        log "✅ OBIX import structure validation completed successfully"
    else
        log "❌ Import structure validation failed"
        exit 1
    fi
}

# Execute validation
main "$@"
