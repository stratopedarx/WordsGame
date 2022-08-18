//
//  MainView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel: MainViewModel
    private var tabComponents: [TabComponentProtocol]

    init(viewModel: MainViewModel, tabComponents: [TabComponentProtocol]) {
        self.viewModel = viewModel
        self.tabComponents = tabComponents
    }
    
    var body: some View {
        GeneralTabView(tabComponents: tabComponents)
    }
}
