//
//  PlaceholderView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 29.08.2022.
//

import SwiftUI

struct PlaceholderView: View {
    let iconName: IconName
    let iconSize: CGFloat = MagicNumber.x6
    let color: Color = .blue.opacity(0.7)
    let title: Localizable
    var subtitle: Localizable?
    
    let fontSizeTitle: CGFloat = 22
    let fontSizeHeading: CGFloat = 16
    let subtitleWidth: CGFloat = 230
    
    var body: some View {
        VStack(alignment: .center, spacing: MagicNumber.x) {
            Spacer()
            IconView(iconName: iconName, fontSize: iconSize, color: color)
            Text(title.localized)
                .lineLimit(1)
                .modifier(PrimaryFontStyle(size: fontSizeTitle, color: .blue, weight: .bold))
            if let subtitle = subtitle?.localized {
                Text(subtitle)
                    .modifier(PrimaryFontStyle(size: fontSizeHeading, color: .blue, weight: .medium))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: subtitleWidth)
            }
            Spacer()
        }
    }
}
