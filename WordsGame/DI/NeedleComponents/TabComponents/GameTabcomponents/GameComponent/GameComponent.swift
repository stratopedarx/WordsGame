//
//  GameComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 23.08.2022.
//

import NeedleFoundation
import SwiftUI

protocol GameComponentProtocol {
    func buildView(gameWord: String, players: [Player]) -> AnyView
}

protocol GameDependency: Dependency {
    var cacheManager: CacheManagerProtocol { get }
}

final class GameComponent: Component<GameDependency>, GameComponentProtocol {
    func buildView(gameWord: String, players: [Player]) -> AnyView {
        AnyView(
            GameView(viewModel: GameViewModel(gameWord: gameWord, players: players, cacheManager: dependency.cacheManager))
        )
    }
}
