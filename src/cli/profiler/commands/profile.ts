/**
 * OBIX Framework Profiler Profile Command
 * Refactored to use proper service abstraction and maintain DOP boundaries
 */

import { ProfilerService, ProfilerServiceOptions } from '@core/profiler';
import { ServiceContainer } from '@core/ioc/containers/ServiceContainer';

export interface ProfileCommandOptions extends ProfilerServiceOptions {
  // Command-specific options can extend service options
}

/**
 * Profile Command Implementation
 * Thin shell that delegates to service layer
 */
export class ProfileCommand {
  private readonly profilerService: ProfilerService;
  
  constructor(serviceContainer: ServiceContainer) {
    this.profilerService = serviceContainer.resolve('profilerService');
  }
  
  /**
   * Execute profile command
   */
  async execute(options: ProfileCommandOptions = {}): Promise<void> {
    try {
      console.log(`Executing profiler profile operation...`);
      
      const result = await this.profilerService.execute(options);
      
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
export function createProfileCommand(serviceContainer: ServiceContainer): ProfileCommand {
  return new ProfileCommand(serviceContainer);
}
