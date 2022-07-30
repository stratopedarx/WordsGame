//
//  BasicComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import NeedleFoundation
import SwiftUI

final class BasicComponent: BootstrapComponent {
    
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
