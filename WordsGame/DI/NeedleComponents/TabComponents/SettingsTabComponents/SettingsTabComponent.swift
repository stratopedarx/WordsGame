//
//  SettingsComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import NeedleFoundation
import SwiftUI

protocol SettingsTabComponentProtocol {
    var settingsTabView: AnyView { get }
}

protocol SettingsTabDependency: Dependency {
    
}

final class SettingsTabComponent: Component<SettingsTabDependency>, SettingsTabComponentProtocol {
    var settingsTabViewModel: SettingsTabViewModel {
        SettingsTabViewModel()
    }
    
    var settingsTabView: AnyView {
        AnyView(
            SettingsTabView(
                viewModel: settingsTabViewModel,
                exclusionWordsComponent: ExclusionWordsComponent(parent: self)
            )
        )
    }
}

extension SettingsTabComponent: TabComponentProtocol {
    var tabIcon: IconName {
        .gear
    }
    
    var tabTitle: Localizable {
        .settingsTabTitle
    }
    
    var tag: MainTabsSelection {
        .settings
    }
    
    var view: AnyView {
        settingsTabView
    }
}
