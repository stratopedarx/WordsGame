

import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->SettingsTabComponent->ExclusionWordsComponent") { component in
        return ExclusionWordsDependencyf87759aec5fc5d05ed9aProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->SettingsTabComponent") { component in
        return SettingsTabDependency166628ee8677ad88f4ffProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->GameTabComponent") { component in
        return GameTabDependencyfb323e3bf81e8df98c74Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->BasicComponent->GameTabComponent->GameComponent") { component in
        return GameDependency8cb03860447bcd154348Provider(component: component)
    }
    
}

// MARK: - Providers

private class ExclusionWordsDependencyf87759aec5fc5d05ed9aBaseProvider: ExclusionWordsDependency {


    init() {

    }
}
/// ^->BasicComponent->SettingsTabComponent->ExclusionWordsComponent
private class ExclusionWordsDependencyf87759aec5fc5d05ed9aProvider: ExclusionWordsDependencyf87759aec5fc5d05ed9aBaseProvider {
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
private class GameDependency8cb03860447bcd154348BaseProvider: GameDependency {
    var cacheManager: CacheManagerProtocol {
        return basicComponent.cacheManager
    }
    var yandexDictAPI: YandexDictAPIProtocol {
        return basicComponent.yandexDictAPI
    }
    private let basicComponent: BasicComponent
    init(basicComponent: BasicComponent) {
        self.basicComponent = basicComponent
    }
}
/// ^->BasicComponent->GameTabComponent->GameComponent
private class GameDependency8cb03860447bcd154348Provider: GameDependency8cb03860447bcd154348BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(basicComponent: component.parent.parent as! BasicComponent)
    }
}
