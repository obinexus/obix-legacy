[0;34m[TECHNICAL][0m [2025-06-07 14:34:33] Initiating comprehensive OBIX framework validation with absolute path resolution...
[0;34m[TECHNICAL][0m [2025-06-07 14:34:33] Validating OBIX namespace absolute path resolution...
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/automaton → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/automaton
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/ioc → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/ioc
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/vhtml → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/vhtml
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/vdom → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/vdom
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/common → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/common
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/ast → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/ast
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @api → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/api
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @parser → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/parser
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/parser → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/parser
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/validation → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/validation
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @cli → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/cli
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @obix → /mnt/c/Users/OBINexus/Projects/Packages/obix/src
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @diff → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/diff
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/dop → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/dop
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @factory → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/factory
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/vcss → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/vcss
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core/policy → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core/policy
[0;32m[VALIDATION-SUCCESS][0m [2025-06-07 14:34:33] Namespace anchor verified: @core → /mnt/c/Users/OBINexus/Projects/Packages/obix/src/core
[0;34m[TECHNICAL][0m [2025-06-07 14:34:33] Namespace path resolution summary:
[0;34m[TECHNICAL][0m [2025-06-07 14:34:33]   Validated namespaces: 18
[0;34m[TECHNICAL][0m [2025-06-07 14:34:33]   Path resolution errors: 0
[0;34m[TECHNICAL][0m [2025-06-07 14:34:33] Executing import pattern compliance validation with absolute path context...
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/analyzer/commands/analyze.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/analyzer/commands/analyze.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/analyzer/commands/metrics.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/analyzer/commands/metrics.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/analyzer/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/analyzer/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/bundler/commands/analyze-bundle.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 12:import { CommandHandler } from '../../CommandHandler';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 13:import { ServiceContainer } from '../../../core/ioc/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 14:import { StateMachineMinimizer } from '../../../core/automaton/minimizer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/bundler/commands/analyze-bundle.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/bundler/commands/bundle.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/bundler/commands/bundle.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/bundler/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/bundler/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/cache/commands/clear.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/cache/commands/clear.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/cache/commands/status.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/cache/commands/status.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/cache/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/cache/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/command/CommandRegistry.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Critical boundary violation detected: src/cli/compiler/commands/compile.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:33]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:33] Relative imports detected: src/cli/compiler/commands/compile.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/compiler/commands/CompileCommand.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 3:import { BaseCommand, CommandCategory, CommandMetadata } from '../../CommandRegistry';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 4:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/compiler/commands/CompileCommand.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/compiler/commands/watch.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/compiler/commands/watch.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/compiler/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/compiler/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/minifier/commands/minify.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/minifier/commands/minify.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/minifier/commands/optimize.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/minifier/commands/optimize.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/minifier/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/minifier/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/policy/commands/check.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 3:import { EnvironmentManager } from '../../../policy/environment/EnvironmentManager';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/policy/commands/check.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/policy/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/policy/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/profiler/commands/profile.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/profiler/commands/profile.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/profiler/commands/report.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from '../../../core/ioc/containers/ServiceContainer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from '../../command/CommandRegistry';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/profiler/commands/report.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/profiler/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { ServiceContainer } from '../../core/ioc/containers/ServiceContainer';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/profiler/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/test-module/commands/hello.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from "../../../core/ioc/ServiceContainer";
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 9:import { CommandHandler } from "../../command/CommandRegistry";
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/test-module/commands/hello.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/cli/test-module/index.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 8:import { ServiceContainer } from "../../core/ioc/ServiceContainer";
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/cli/test-module/index.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/core/api/functional/component.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 2:import { ComponentConfig } from '../../config/component.js';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/functional/component.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/functional/FunctionalComponent.ts (4 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/hooks/createComponent.ts (9 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/hooks/useComponent.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/base/BaseComponent.ts (8 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/components/ComponentLifeCycle.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/components/ComponentStateManagement.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/components/ComponentTransitionManager.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/oop/BaseComponent.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/api/shared/validation/ValidationComponent.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Critical boundary violation detected: src/core/ast/css/optimizers/CSSAst.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:34]   Line: 2:import { CSSNode, CSSNodeType } from "../../css/node/CSSNode";
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/css/optimizers/CSSAst.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/css/optimizers/CSSAstOptimizer.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/optimizers/HTMLAst.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/optimizers/HTMLAstOptimizer.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/optimizers/MemoryOptimizer.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/optimizers/NodeMapBuilder.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/optimizers/NodeReductionOptimizer.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/processors/HMTLAstProcessor.ts (11 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/validators/AttributeValidationRule.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/validators/HtmlAstValidator.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/ast/html/validators/HTMLStructureRule.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/equivalence/EquivalenceClassComputer.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/minimizer/EquivalenceClassComputer.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/minimizer/StateMachineMinimizer.ts (5 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/state/AdvancedTransitionCache.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/state/CacheableStateMachine.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/state/EnhancedCachableStateMachine.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/state/EnhancedStateMachineTransitionCache.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/state/OptimizedStateMachine.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:34] Relative imports detected: src/core/automaton/transition/StateMachineTransitionCache.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/common/constants/cache-constants.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/common/constants/minimization-constants.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/components/ObixComponent.ts (11 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/adapter/DOPAdapter.ts (9 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/adapter/DOPValidtionIntergrator.ts (6 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/adapter/ValidationDOPAdapter.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/BehaviorModel.ts (4 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/BehaviourModel.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/EnhacedValidationBehaviourModel.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/EnhancedBehaviourChain.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/OptimizedBehaviour.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/OptimizedValidationBehaviourModel.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/TransformBehavior.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/ValidationBehaviorModelImpl.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/behavior/ValidationBehaviourModel.ts (4 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/common/ImplementationComparisonResult.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/common/ImplementationMismatchError.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/data/ValidatationDataModelImpl.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/data/ValidationDataModelImpl.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/factory/DataModelFactory.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/dop/factory/ValidationDOPFactory.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/AstProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/AutomatonProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/DiffProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/DOPProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/index.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Critical boundary violation detected: src/core/ioc/providers/ParserProvider.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 4:import { HTMLTokenizer } from '../../parser/html/tokenizer/HTMLTokenizer';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 5:import { HTMLReader } from '../../parser/html/readers/HTMLReader';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 6:import { HTMLToken } from '../../parser/html/tokenizer/tokens';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 7:import { ProcessorFactory } from '../../parser/html/tokenizer/processors/ProcessorFactory';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/ParserProvider.ts (5 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Critical boundary violation detected: src/core/ioc/providers/PolicyProvider.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 10:import { EnvironmentManager } from '../../policy/environment/EnvironmentManager';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 11:import { PolicyRuleEngine } from '../../policy/engine/PolicyRuleEngine';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 12:import { DynamicPolicyLoader, PolicyConfigSource } from '../../policy/loading/DynamicPolicyLoader';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 13:import { PolicyViolationReporter } from '../../policy/reporting/PolicyViolationReporter';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 14:import { PolicyBranching } from '../../policy/branching/PolicyBranching';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 15:import { PolicyValidationRule } from '../../policy/engine/ValidationRule';
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 16:import { DEVELOPMENT_ONLY, PRODUCTION_BLOCKED, PII_PROTECTION, ADMIN_ONLY } from '../../policy';
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/PolicyProvider.ts (8 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/ServiceRegistry.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/UtilityProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/providers/ValidationProvider.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/ioc/registry/ServiceRegistry.ts (9 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/errors/CSSParserError.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/AtRuleReader.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/BlockReader.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/CSSFileReader.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/CSSReader.ts (2 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/PropertyReader.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/ReaderFactory.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/SelectorReader.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/readers/ValueReader.ts (1 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Relative imports detected: src/core/parser/css/states/CSSParser.ts (3 occurrences)
[1;33m[COMPLIANCE-VIOLATION][0m [2025-06-07 14:34:35] Critical boundary violation detected: src/core/parser/css/states/CSSStateMachine.ts
[0;31m[ARCHITECTURAL-ERROR][0m [2025-06-07 14:34:35]   Line: 2:import { CSSNode, CSSNodeType } from '../../../ast/node/CSSNode.js';
