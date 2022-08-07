

import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->GameTabComponent") { component in
        return GameTabDependencyfb323e3bf81e8df98c74Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->SettingsTabComponent") { component in
        return SettingsTabDependency166628ee8677ad88f4ffProvider(component: component)
    }
    
}

// MARK: - Providers

private class GameTabDependencyfb323e3bf81e8df98c74BaseProvider: GameTabDependency {


    init() {

    }
}
/// ^->BasicComponent->GameTabComponent
private class GameTabDependencyfb323e3bf81e8df98c74Provider: GameTabDependencyfb323e3bf81e8df98c74BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}
private class SettingsTabDependency166628ee8677ad88f4ffBaseProvider: SettingsTabDependency {


    init() {

    }
}
/// ^->BasicComponent->SettingsTabComponent
private class SettingsTabDependency166628ee8677ad88f4ffProvider: SettingsTabDependency166628ee8677ad88f4ffBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init()
    }
}