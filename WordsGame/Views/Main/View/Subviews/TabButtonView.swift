//
//  TabButtonView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct TabButtonView: View {
    let iconName: IconName
    let title: Localizable
    
    var body: some View {
        VStack(spacing: MagicNumber.x) {
            IconView(iconName: iconName, fontSize: MagicNumber.x3)
            Text(title.localized)
        }
//        .environment(\.symbolVariants, .none)  // Todo check
    }
}
