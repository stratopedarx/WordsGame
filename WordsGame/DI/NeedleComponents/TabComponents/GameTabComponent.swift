//
//  GameComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import NeedleFoundation
import SwiftUI

protocol GameTabComponentProtocol {
    var gameTabView: AnyView { get }
}

protocol GameTabDependency: Dependency {
    
}

final class GameTabComponent: Component<GameTabDependency>, GameTabComponentProtocol {
    var gameTabViewModel: GameTabViewModel {
        GameTabViewModel()
    }
    
    var gameTabView: AnyView {
        AnyView(GameTabView(viewModel: gameTabViewModel))
    }
}

extension GameTabComponent: TabComponentProtocol {
    var tabIcon: IconName {
        .gamecontroller
    }
    
    var tabTitle: Localizable {
        .gameTabTitle
    }
    
    var tag: MainTabsSelection {
        .game
    }
    
    var view: AnyView {
        gameTabView
    }
}
