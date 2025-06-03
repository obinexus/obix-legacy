/**
 * OBIX Framework CLI Compiler Module
 * Unified export for compiler CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { CompilerServiceOptions, CompilerResult } from '@core/compiler';
