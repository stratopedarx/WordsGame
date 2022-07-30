//
//  IconView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

struct IconView: View {
    let iconName: IconName
    var fontSize: CGFloat = MagicNumber.x2
    var color: Color?
    var weight: Font.Weight = .regular
    
    var body: some View {
        let image = buildImage()
        if let color = color {
            image.foregroundColor(color)
        } else {
            image
        }
    }
}

private extension IconView {
    func buildImage() -> some View {
        let image = iconName.type == .system ? Image(systemName: iconName.rawValue) : Image(iconName.rawValue)
        return image.font(.system(size: fontSize, weight: weight))
    }
}
