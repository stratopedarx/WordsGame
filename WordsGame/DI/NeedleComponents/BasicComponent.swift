//
//  BasicComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import NeedleFoundation
import SwiftUI

final class BasicComponent: BootstrapComponent {
    
    private lazy var mainNetworkGateway: NetworkGatewayProtocol = {
        NetworkGateway(
            sessionManager: .default,
            baseURL: URL(string: GWConstants.YandexAPI.baseUrl)!,
            prefix: "",
            adapters: []
        )
    }()
    
    var cacheManager: CacheManagerProtocol {
        shared { CacheManager.shared }
    }
    
    var yandexDictAPI: YandexDictAPIProtocol {
        shared { YandexDictAPI(networking: mainNetworkGateway) }
    }
    
    var mainViewModel: MainViewModel {
        MainViewModel()
    }
    
    var mainView: some View {
        MainView(
            viewModel: mainViewModel,
            tabComponents: [
                GameTabComponent(parent: self),
                SettingsTabComponent(parent: self)
            ]
        )
    }
}
