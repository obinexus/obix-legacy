#!/bin/bash
# OBIX Module Architecture Analysis Script
# Analyzes module structure, dependencies, and compliance with cost function prioritization
# Project: Aegis - OBIX Framework
# Methodology: Waterfall Development with Systematic Analysis

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly SRC_DIR="$PROJECT_ROOT/src"
readonly OUTPUT_FILE="$PROJECT_ROOT/module-analysis-$(date +%Y%m%d-%H%M%S).json"
readonly LOG_FILE="$PROJECT_ROOT/module-analysis-$(date +%Y%m%d-%H%M%S).log"

# Cost Function Priority Matrix (aligned with refactoring script)
declare -A COST_PRIORITY_MATRIX=(
    ["core/common"]="1"           # Foundation layer
    ["core/automaton"]="2"        # State minimization engine
    ["core/dop"]="3"              # Data-Oriented Programming adapter
    ["core/validation"]="4"       # Validation infrastructure
    ["core/parser"]="5"           # Parser components
    ["core/api"]="6"              # API surface layer
    ["core/ast"]="7"              # AST optimization
    ["core/ioc"]="8"              # IoC container system
    ["cli"]="9"                   # Command-line interface
    ["core/policy"]="10"          # Policy enforcement
)

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

# Calculate module complexity metrics
calculate_module_metrics() {
    local module_path="$1"
    local full_path="$SRC_DIR/$module_path"
    
    if [ ! -d "$full_path" ]; then
        echo "null"
        return
    fi
    
    # Count TypeScript files
    local ts_files=$(find "$full_path" -name "*.ts" -type f | wc -l)
    
    # Count dependencies (imports)
    local import_count=$(find "$full_path" -name "*.ts" -type f -exec grep -c "^import" {} \; 2>/dev/null | awk '{sum+=$1} END {print sum+0}')
    
    # Count internal dependencies (@obix imports)
    local internal_deps=$(find "$full_path" -name "*.ts" -type f -exec grep -c "from ['\"]@obix" {} \; 2>/dev/null | awk '{sum+=$1} END {print sum+0}')
    
    # Count external dependencies
    local external_deps=$(( import_count - internal_deps ))
    
    # Calculate lines of code
    local loc=$(find "$full_path" -name "*.ts" -type f -exec wc -l {} \; 2>/dev/null | awk '{sum+=$1} END {print sum+0}')
    
    # Check for index.ts presence
    local has_index="false"
    if [ -f "$full_path/index.ts" ]; then
        has_index="true"
    fi
    
    # Check for IoC provider
    local has_provider="false"
    if find "$full_path" -name "*Provider.ts" -type f | grep -q .; then
        has_provider="true"
    fi
    
    # Get priority level
    local priority="${COST_PRIORITY_MATRIX[$module_path]:-999}"
    
    # Calculate complexity score
    local complexity_score=$(( (ts_files * 10) + (import_count * 5) + (loc / 100) ))
    
    cat << EOF
{
  "path": "$module_path",
  "priority": $priority,
  "metrics": {
    "typeScriptFiles": $ts_files,
    "totalImports": $import_count,
    "internalDependencies": $internal_deps,
    "externalDependencies": $external_deps,
    "linesOfCode": $loc,
    "complexityScore": $complexity_score,
    "hasIndex": $has_index,
    "hasIoCProvider": $has_provider
  }
}
EOF
}

# Analyze dependency relationships
analyze_dependency_graph() {
    log "Analyzing module dependency relationships..."
    
    local dependency_graph="["
    local first=true
    
    for module_path in "${!COST_PRIORITY_MATRIX[@]}"; do
        local full_path="$SRC_DIR/$module_path"
        
        if [ -d "$full_path" ]; then
            if [ "$first" = true ]; then
                first=false
            else
                dependency_graph="$dependency_graph,"
            fi
            
            local module_data=$(calculate_module_metrics "$module_path")
            dependency_graph="$dependency_graph$module_data"
        fi
    done
    
    dependency_graph="$dependency_graph]"
    echo "$dependency_graph"
}

# Generate compliance report
generate_compliance_report() {
    log "Generating OBIX architecture compliance report..."
    
    local high_priority_modules=0
    local compliant_modules=0
    local total_modules=0
    
    for module_path in "${!COST_PRIORITY_MATRIX[@]}"; do
        local priority="${COST_PRIORITY_MATRIX[$module_path]}"
        local full_path="$SRC_DIR/$module_path"
        
        if [ -d "$full_path" ]; then
            ((total_modules++))
            
            if [ "$priority" -le 5 ]; then
                ((high_priority_modules++))
                
                # Check compliance criteria
                if [ -f "$full_path/index.ts" ]; then
                    ((compliant_modules++))
                fi
            fi
        fi
    done
    
    local compliance_rate=0
    if [ "$high_priority_modules" -gt 0 ]; then
        compliance_rate=$(( compliant_modules * 100 / high_priority_modules ))
    fi
    
    cat << EOF
{
  "complianceMetrics": {
    "totalModules": $total_modules,
    "highPriorityModules": $high_priority_modules,
    "compliantModules": $compliant_modules,
    "complianceRate": $compliance_rate
  }
}
EOF
}

# Main analysis process
main() {
    log "Starting OBIX module architecture analysis..."
    
    # Generate dependency analysis
    local dependency_data=$(analyze_dependency_graph)
    
    # Generate compliance report
    local compliance_data=$(generate_compliance_report)
    
    # Create comprehensive analysis report
    cat > "$OUTPUT_FILE" << EOF
{
  "analysisMetadata": {
    "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
    "framework": "OBIX",
    "methodology": "Aegis Waterfall",
    "version": "0.1.0"
  },
  "moduleAnalysis": $dependency_data,
  "compliance": $compliance_data
}
EOF
    
    log "Module analysis completed successfully"
    log "Results written to: $OUTPUT_FILE"
    
    # Display summary
    echo ""
    echo "📊 OBIX Module Analysis Summary"
    echo "================================"
    jq -r '.compliance.complianceMetrics | "Total Modules: \(.totalModules)\nHigh Priority Modules: \(.highPriorityModules)\nCompliant Modules: \(.compliantModules)\nCompliance Rate: \(.complianceRate)%"' "$OUTPUT_FILE" 2>/dev/null || {
        echo "Analysis complete - install 'jq' for detailed summary"
    }
}

# Execute with error handling
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
