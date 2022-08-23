//
//  GameComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import NeedleFoundation
import SwiftUI

protocol GameComponentProtocol {
    func buildView(players: [Player], placeholderNames: [String]) -> AnyView
}

protocol GameDependency: Dependency {
}

final class GameComponent: Component<GameDependency>, GameComponentProtocol {
    func buildView(players: [Player], placeholderNames: [String]) -> AnyView {
        AnyView(
            GameView(
                viewModel: GameViewModel(players: players, placeholderNames: placeholderNames)
            )
        )
    }
}
