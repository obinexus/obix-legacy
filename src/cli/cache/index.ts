/**
 * OBIX Framework CLI Cache Module
 * Unified export for cache CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { CacheServiceOptions, CacheResult } from '@core/cache';
