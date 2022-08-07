//
//  GeneralTabView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct GeneralTabView: View {
    @State var selectedTab: MainTabsSelection = GWConstants.initialSelectedTab
    var tabComponents: [TabComponentProtocol]
    
    init(tabComponents: [TabComponentProtocol]) {
        self.tabComponents = tabComponents
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<tabComponents.count, id: \.self) { index in
                let tabComponent = tabComponents[index]
                tabComponent.view.tabItem {
                    TabButtonView(iconName: tabComponent.tabIcon, title: tabComponent.tabTitle)
                }
                .tag(tabComponent.tag)
            }
        }
        .accentColor(.blue)
    }
}
