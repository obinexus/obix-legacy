/**
 * OBIX Framework CLI Policy Module
 * Unified export for policy CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { PolicyServiceOptions, PolicyResult } from '@core/policy';
