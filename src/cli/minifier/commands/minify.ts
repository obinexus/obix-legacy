/**
 * OBIX Framework Minifier Minify Command
 * Refactored to use proper service abstraction and maintain DOP boundaries
 */

import { MinifierService, MinifierServiceOptions } from '@core/minifier';
import { ServiceContainer } from '@core/ioc/containers/ServiceContainer';

export interface MinifyCommandOptions extends MinifierServiceOptions {
  // Command-specific options can extend service options
}

/**
 * Minify Command Implementation
 * Thin shell that delegates to service layer
 */
export class MinifyCommand {
  private readonly minifierService: MinifierService;
  
  constructor(serviceContainer: ServiceContainer) {
    this.minifierService = serviceContainer.resolve('minifierService');
  }
  
  /**
   * Execute minify command
   */
  async execute(options: MinifyCommandOptions = {}): Promise<void> {
    try {
      console.log(`Executing minifier minify operation...`);
      
      const result = await this.minifierService.execute(options);
      
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
export function createMinifyCommand(serviceContainer: ServiceContainer): MinifyCommand {
  return new MinifyCommand(serviceContainer);
}
