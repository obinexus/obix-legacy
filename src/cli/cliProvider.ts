export interface cliProvider {
  configure(container: ServiceContainer): void;
  getServices(): string[];
  getDependencies(): string[];
}

export class cliProviderImpl implements cliProvider {
  configure(container: ServiceContainer): void {
    // IoC service registration implementation
    container.register("cli", () => new ());
  }
  
  getServices(): string[] {
    return [];
  }
  
  getDependencies(): string[] {
    return [];
  }
}
