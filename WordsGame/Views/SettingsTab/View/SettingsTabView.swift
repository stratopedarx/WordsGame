//
//  SettingsTabView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct SettingsTabView: View {
    @ObservedObject private var viewModel: SettingsTabViewModel
    
    init(viewModel: SettingsTabViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}
