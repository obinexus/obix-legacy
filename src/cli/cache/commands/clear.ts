/**
 * OBIX Framework Cache Clear Command
 * Refactored to use proper service abstraction and maintain DOP boundaries
 */

import { CacheService, CacheServiceOptions } from '@core/cache';
import { ServiceContainer } from '@core/ioc/containers/ServiceContainer';

export interface ClearCommandOptions extends CacheServiceOptions {
  // Command-specific options can extend service options
}

/**
 * Clear Command Implementation
 * Thin shell that delegates to service layer
 */
export class ClearCommand {
  private readonly cacheService: CacheService;
  
  constructor(serviceContainer: ServiceContainer) {
    this.cacheService = serviceContainer.resolve('cacheService');
  }
  
  /**
   * Execute clear command
   */
  async execute(options: ClearCommandOptions = {}): Promise<void> {
    try {
      console.log(`Executing cache clear operation...`);
      
      const result = await this.cacheService.execute(options);
      
      if (result.success) {
        console.log(`✅ ${result.message}`);
        
        if (options.verbose && result.metrics) {
          console.log(`📊 Execution time: ${result.metrics.executionTime.toFixed(2)}ms`);
          console.log(`💾 Memory usage: ${(result.metrics.memoryUsage / 1024 / 1024).toFixed(2)}MB`);
        }
        
        if (result.data && options.verbose) {
          console.log(`📋 Result:`, JSON.stringify(result.data, null, 2));
        }
      } else {
        console.error(`❌ ${result.message}`);
        process.exit(1);
      }
      
    } catch (error) {
      console.error(`💥 Command execution failed:`, error instanceof Error ? error.message : 'Unknown error');
      process.exit(1);
    }
  }
}

/**
 * Command factory function
 */
export function createClearCommand(serviceContainer: ServiceContainer): ClearCommand {
  return new ClearCommand(serviceContainer);
}
