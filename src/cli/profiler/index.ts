/**
 * OBIX Framework CLI Profiler Module
 * Unified export for profiler CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { ProfilerServiceOptions, ProfilerResult } from '@core/profiler';
