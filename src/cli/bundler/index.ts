/**
 * OBIX Framework CLI Bundler Module
 * Unified export for bundler CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { BundlerServiceOptions, BundlerResult } from '@core/bundler';
