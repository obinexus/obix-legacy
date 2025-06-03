export interface commonProvider {
  configure(container: ServiceContainer): void;
  getServices(): string[];
  getDependencies(): string[];
}

export class commonProviderImpl implements commonProvider {
  configure(container: ServiceContainer): void {
    // IoC service registration implementation
    container.register("common", () => new ());
  }
  
  getServices(): string[] {
    return [];
  }
  
  getDependencies(): string[] {
    return [];
  }
}
