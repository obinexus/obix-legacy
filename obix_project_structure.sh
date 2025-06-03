#!/bin/bash
# OBIX Framework Project Structure Initialization and Validation Script
# Ensures proper directory structure and tool placement for namespace migration

set -euo pipefail

readonly PROJECT_ROOT="$(pwd)"
readonly SCRIPTS_DIR="$PROJECT_ROOT/scripts"
readonly TOOLS_DIR="$SCRIPTS_DIR/tools"
readonly SETUP_DIR="$SCRIPTS_DIR/setup"
readonly BUILD_DIR="$SCRIPTS_DIR/build"
readonly TEST_DIR="$SCRIPTS_DIR/test"

# ANSI color codes for structured output
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

log_structure() {
    echo -e "${BLUE}[STRUCTURE]${NC} $*"
}

log_creation() {
    echo -e "${GREEN}[CREATED]${NC} $*"
}

log_validation() {
    echo -e "${YELLOW}[VALIDATION]${NC} $*"
}

# Create standardized directory structure
create_directory_structure() {
    log_structure "Creating OBIX framework standardized directory structure..."
    
    # Core script directories
    mkdir -p "$TOOLS_DIR"
    mkdir -p "$SETUP_DIR"
    mkdir -p "$BUILD_DIR/compile"
    mkdir -p "$TEST_DIR/performance"
    mkdir -p "$SCRIPTS_DIR/release/prepare"
    mkdir -p "$SCRIPTS_DIR/release/publish"
    mkdir -p "$SCRIPTS_DIR/dev/examples"
    
    log_creation "Directory structure established"
}

# Define expected file locations based on package.json
define_tool_locations() {
    log_structure "Defining tool locations according to package.json specifications..."
    
    cat << 'EOF'
OBIX Framework Tool Location Mapping:
=====================================

Required Tools and Locations:
- scripts/tools/validate-namespace-tree.sh
- scripts/tools/obix-namespace-validator.sh
- scripts/tools/import-migration-tool.ts
- scripts/tools/package-json-validator.sh
- scripts/tools/debug-namespace-structure.sh

Build Infrastructure:
- scripts/build/compile/index.ts
- scripts/setup/dev-workflow.sh
- scripts/setup/dev-setup.sh
- scripts/test/performance/index.js
- scripts/test/performance/benchmarks.js

Validation Scripts:
- scripts/validate-imports.sh
- scripts/analyze-modules.sh
- scripts/verify-outputs.js

Release Management:
- scripts/release/prepare/index.js
- scripts/release/publish/index.js
EOF
}

# Create tool placement verification
verify_tool_placement() {
    log_validation "Verifying tool placement according to package.json expectations..."
    
    local missing_files=0
    
    # Expected tool files from package.json analysis
    local expected_tools=(
        "scripts/tools/validate-namespace-tree.sh"
        "scripts/tools/obix-namespace-validator.sh"
        "scripts/tools/import-migration-tool.ts"
        "scripts/validate-imports.sh"
        "scripts/analyze-modules.sh"
    )
    
    for tool in "${expected_tools[@]}"; do
        if [ -f "$PROJECT_ROOT/$tool" ]; then
            log_creation "✓ Found: $tool"
        else
            log_validation "✗ Missing: $tool"
            ((missing_files++))
        fi
    done
    
    if [ $missing_files -gt 0 ]; then
        echo "Missing $missing_files required tool files"
        return 1
    else
        echo "All required tools properly placed"
        return 0
    fi
}

# Generate file placement instructions
generate_placement_instructions() {
    cat << 'EOF' > "$PROJECT_ROOT/TOOL_PLACEMENT_GUIDE.md"
# OBIX Framework Tool Placement Guide

## Directory Structure Requirements

Based on package.json script definitions, place tools as follows:

### Core Validation Tools
```
scripts/tools/
├── validate-namespace-tree.sh          # Basic namespace validation
├── obix-namespace-validator.sh         # Comprehensive validation system
├── import-migration-tool.ts             # Automated import migration
├── package-json-validator.sh           # Package.json compliance checker
└── debug-namespace-structure.sh        # Structure debugging tool
```

### Build and Setup Scripts
```
scripts/
├── validate-imports.sh                 # Import validation script
├── analyze-modules.sh                  # Module analysis tool
├── verify-outputs.js                   # Build output verification
├── setup/
│   ├── dev-workflow.sh                 # Development workflow
│   └── dev-setup.sh                    # Environment setup
└── build/
    └── compile/
        └── index.ts                     # Build compilation entry
```

### Testing Infrastructure
```
scripts/test/
├── performance/
│   ├── index.js                        # Performance testing
│   └── benchmarks.js                   # Benchmark execution
```

### Release Management
```
scripts/release/
├── prepare/
│   └── index.js                        # Release preparation
└── publish/
    └── index.js                        # Release publication
```

## Implementation Steps

1. Create directory structure: `bash scripts/structure-setup.sh`
2. Place tool files in designated locations
3. Verify placement: `bash scripts/tools/verify-placement.sh`
4. Execute QA validation: `npm run qa:full`

## Package.json Script Alignment

Ensure all script paths in package.json match the standardized structure above.
EOF

    log_creation "Tool placement guide generated: TOOL_PLACEMENT_GUIDE.md"
}

# Main execution
main() {
    log_structure "Initializing OBIX framework project structure standardization..."
    
    create_directory_structure
    define_tool_locations
    generate_placement_instructions
    
    if verify_tool_placement; then
        log_creation "Project structure validation successful"
    else
        log_validation "Project structure requires tool placement completion"
        echo ""
        echo "Next Steps:"
        echo "1. Review TOOL_PLACEMENT_GUIDE.md"
        echo "2. Place missing tools in designated locations"
        echo "3. Re-run structure validation"
    fi
}

# Execute main function
main "$@"