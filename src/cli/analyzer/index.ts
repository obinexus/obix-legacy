/**
 * OBIX Framework CLI Analyzer Module
 * Unified export for analyzer CLI commands
 * Maintains proper abstraction boundaries
 */

// Export all commands from commands directory
export * from './commands';

// Re-export service types for CLI usage
export type { AnalyzerServiceOptions, AnalyzerResult } from '@core/analyzer';
