/**
 * OBIX Framework CLI Minifier Module
 * Unified export for minifier CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { MinifierServiceOptions, MinifierResult } from '@core/minifier';
