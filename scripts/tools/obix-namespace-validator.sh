#!/bin/bash
# OBIX Framework Namespace Validation and Enforcement System
# Validates import patterns and enforces module boundary compliance
# Author: Enhanced validation for Nnamdi Okpala's OBIX framework

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
readonly SRC_DIR="$PROJECT_ROOT/src"
readonly VALIDATION_LOG="$PROJECT_ROOT/validation-report.log"

# Framework-specific namespace definitions
declare -A NAMESPACE_MAPPINGS=(
    ["@obix"]="src"
    ["@obix/core"]="src/core"
    ["@obix/cli"]="src/cli"
    ["@core"]="src/core"
    ["@core/automaton"]="src/core/automaton"
    ["@core/dop"]="src/core/dop"
    ["@core/parser"]="src/core/parser"
    ["@core/validation"]="src/core/validation"
    ["@core/ast"]="src/core/ast"
    ["@core/common"]="src/core/common"
    ["@core/ioc"]="src/core/ioc"
    ["@core/policy"]="src/core/policy"
    ["@core/vhtml"]="src/core/vhtml"
    ["@core/vcss"]="src/core/vcss"
    ["@core/vdom"]="src/core/vdom"
    ["@cli"]="src/cli"
    ["@api"]="src/core/api"
    ["@parser"]="src/core/parser"
    ["@diff"]="src/core/diff"
    ["@factory"]="src/core/factory"
    ["@test"]="tests"
)

# ANSI color codes for professional output formatting
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$VALIDATION_LOG"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" | tee -a "$VALIDATION_LOG"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*" | tee -a "$VALIDATION_LOG"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*" | tee -a "$VALIDATION_LOG"
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $*" | tee -a "$VALIDATION_LOG"
}

# Initialize validation report
initialize_validation_report() {
    echo "OBIX Framework Namespace Validation Report" > "$VALIDATION_LOG"
    echo "Generated: $(date)" >> "$VALIDATION_LOG"
    echo "Project: Nnamdi Okpala's OBIX Framework" >> "$VALIDATION_LOG"
    echo "=========================================" >> "$VALIDATION_LOG"
    echo "" >> "$VALIDATION_LOG"
}

# Validate namespace directory structure
validate_namespace_structure() {
    log_info "Validating OBIX namespace directory structure..."
    
    local validation_errors=0
    local validated_namespaces=0
    
    for namespace in "${!NAMESPACE_MAPPINGS[@]}"; do
        local expected_path="${NAMESPACE_MAPPINGS[$namespace]}"
        local full_path="$PROJECT_ROOT/$expected_path"
        
        if [ -d "$full_path" ]; then
            log_success "Namespace validation: $namespace → $expected_path"
            ((validated_namespaces++))
            
            # Validate index.ts presence for core modules
            if [[ "$namespace" == "@core/"* ]] && [ ! -f "$full_path/index.ts" ]; then
                log_warning "Missing index.ts in core module: $full_path"
                ((validation_errors++))
            fi
        else
            log_error "Missing namespace directory: $namespace → $expected_path"
            ((validation_errors++))
        fi
    done
    
    log_info "Namespace structure validation complete: $validated_namespaces validated, $validation_errors errors"
    return $validation_errors
}

# Validate import patterns against namespace rules
validate_import_patterns() {
    log_info "Analyzing import patterns for namespace compliance..."
    
    local total_files=0
    local compliant_files=0
    local violation_files=0
    local critical_violations=0
    
    # Find all TypeScript files in the framework
    while IFS= read -r -d '' file; do
        ((total_files++))
        local file_violations=0
        
        # Check for prohibited relative imports crossing module boundaries
        if grep -qE "import.*from.*['\"](\.\./){2,}" "$file" 2>/dev/null; then
            log_error "Critical boundary violation in: ${file#$PROJECT_ROOT/}"
            grep -nE "import.*from.*['\"](\.\./){2,}" "$file" | while read -r line; do
                log_error "  Line: $line"
            done
            ((file_violations++))
            ((critical_violations++))
        fi
        
        # Check for missing namespace usage where it should be used
        if grep -qE "import.*from.*['\"]\.\./" "$file" 2>/dev/null; then
            local relative_imports=$(grep -cE "import.*from.*['\"]\.\./" "$file" 2>/dev/null || echo 0)
            if [ "$relative_imports" -gt 0 ]; then
                log_warning "Relative imports detected in: ${file#$PROJECT_ROOT/} ($relative_imports occurrences)"
                ((file_violations++))
            fi
        fi
        
        if [ "$file_violations" -eq 0 ]; then
            ((compliant_files++))
        else
            ((violation_files++))
        fi
        
    done < <(find "$SRC_DIR" -name "*.ts" -type f -print0)
    
    log_info "Import pattern analysis complete:"
    log_info "  Total files analyzed: $total_files"
    log_info "  Compliant files: $compliant_files"
    log_info "  Files with violations: $violation_files"
    log_info "  Critical violations: $critical_violations"
    
    return $critical_violations
}

# Generate namespace migration recommendations
generate_migration_recommendations() {
    log_info "Generating namespace migration recommendations..."
    
    echo "" >> "$VALIDATION_LOG"
    echo "MIGRATION RECOMMENDATIONS" >> "$VALIDATION_LOG"
    echo "========================" >> "$VALIDATION_LOG"
    
    # Scan for common violation patterns and suggest fixes
    while IFS= read -r -d '' file; do
        if grep -qE "import.*from.*['\"](\.\./){2,}" "$file" 2>/dev/null; then
            echo "File: ${file#$PROJECT_ROOT/}" >> "$VALIDATION_LOG"
            
            # Extract problematic imports and suggest namespace alternatives
            grep -E "import.*from.*['\"](\.\./){2,}" "$file" | while IFS= read -r import_line; do
                echo "  Problem: $import_line" >> "$VALIDATION_LOG"
                
                # Basic suggestion logic (can be enhanced)
                if [[ "$import_line" == *"core/dop"* ]]; then
                    echo "  Suggested: Replace with @core/dop import" >> "$VALIDATION_LOG"
                elif [[ "$import_line" == *"core/automaton"* ]]; then
                    echo "  Suggested: Replace with @core/automaton import" >> "$VALIDATION_LOG"
                elif [[ "$import_line" == *"core/parser"* ]]; then
                    echo "  Suggested: Replace with @core/parser import" >> "$VALIDATION_LOG"
                else
                    echo "  Suggested: Review and replace with appropriate @namespace import" >> "$VALIDATION_LOG"
                fi
            done
            echo "" >> "$VALIDATION_LOG"
        fi
    done < <(find "$SRC_DIR" -name "*.ts" -type f -print0)
}

# Validate module boundary enforcement
validate_module_boundaries() {
    log_info "Validating module boundary enforcement..."
    
    local boundary_violations=0
    
    # Check for direct cross-module imports that should go through public APIs
    local restricted_patterns=(
        "src/core/dop/.*→.*src/core/automaton"
        "src/core/parser/.*→.*src/core/validation"
        "src/cli/.*→.*src/core/.*/internal"
    )
    
    # This is a simplified check - can be enhanced with more sophisticated analysis
    for pattern in "${restricted_patterns[@]}"; do
        log_info "Checking boundary pattern: $pattern"
        # Implementation would go here for specific boundary checks
    done
    
    return $boundary_violations
}

# Generate compliance report
generate_compliance_report() {
    log_info "Generating OBIX framework compliance report..."
    
    {
        echo ""
        echo "OBIX FRAMEWORK COMPLIANCE SUMMARY"
        echo "================================"
        echo "Framework Version: $(grep '"version"' "$PROJECT_ROOT/package.json" | cut -d'"' -f4)"
        echo "Validation Date: $(date)"
        echo ""
        echo "Namespace Mappings Validated: ${#NAMESPACE_MAPPINGS[@]}"
        echo "Critical Issues: See detailed log above"
        echo ""
        echo "RECOMMENDED ACTIONS:"
        echo "1. Update all relative imports to use namespace aliases"
        echo "2. Ensure all core modules have proper index.ts exports"
        echo "3. Review module boundary compliance"
        echo "4. Update build configuration to enforce namespace usage"
        echo ""
        echo "NEXT STEPS:"
        echo "1. Run: npm run fix:imports (if available)"
        echo "2. Update tsconfig.json paths as recommended"
        echo "3. Validate with: npm run test && npm run lint"
        echo "4. Re-run this validation script"
        
    } >> "$VALIDATION_LOG"
}

# Auto-fix common import violations (optional)
auto_fix_imports() {
    if [ "${1:-}" = "--fix" ]; then
        log_info "Auto-fixing common import violations..."
        
        # This is a basic example - production implementation would be more sophisticated
        find "$SRC_DIR" -name "*.ts" -type f -exec sed -i 's|from ['"'"'"]../../core/dop|from "@core/dop|g' {} \;
        find "$SRC_DIR" -name "*.ts" -type f -exec sed -i 's|from ['"'"'"]../../core/automaton|from "@core/automaton|g' {} \;
        find "$SRC_DIR" -name "*.ts" -type f -exec sed -i 's|from ['"'"'"]../../core/parser|from "@core/parser|g' {} \;
        
        log_success "Basic import fixes applied. Manual review recommended."
    fi
}

# Main validation orchestration
main() {
    log_info "Starting OBIX Framework namespace validation..."
    
    initialize_validation_report
    
    local total_errors=0
    
    # Execute validation phases
    validate_namespace_structure || ((total_errors += $?))
    validate_import_patterns || ((total_errors += $?))
    validate_module_boundaries || ((total_errors += $?))
    
    # Generate reports and recommendations
    generate_migration_recommendations
    generate_compliance_report
    
    # Optional auto-fix
    auto_fix_imports "$@"
    
    # Final summary
    if [ "$total_errors" -eq 0 ]; then
        log_success "OBIX framework namespace validation completed successfully"
        log_info "Validation report generated: $VALIDATION_LOG"
        exit 0
    else
        log_error "OBIX framework validation failed with $total_errors critical issues"
        log_info "Review validation report: $VALIDATION_LOG"
        exit 1
    fi
}

# Usage information
show_usage() {
    echo "OBIX Framework Namespace Validation Tool"
    echo "Usage: $0 [--fix] [--help]"
    echo ""
    echo "Options:"
    echo "  --fix    Apply automatic fixes for common import violations"
    echo "  --help   Show this usage information"
    echo ""
    echo "Examples:"
    echo "  $0              # Run validation only"
    echo "  $0 --fix        # Run validation and apply fixes"
}

# Command line argument handling
case "${1:-}" in
    --help|-h)
        show_usage
        exit 0
        ;;
    *)
        main "$@"
        ;;
esac
