//
//  HeaderGameView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct HeaderGameView: View {
    var action: () -> Void
    var refresh: Bool = false
    var refreshAction: () -> Void = {}
    
    var body: some View {
        ZStack {
            TitleText()
            if refresh {
                HeaderGameViewButton(isLeadingButton: true, action: refreshAction)
            }
            HeaderGameViewButton(action: action)
        }
        .padding(.top, MagicNumber.x4)
    }
}

private struct HeaderGameViewButton: View {
    var isLeadingButton: Bool = false
    var action: () -> Void
    var size: Double = 1.2
    var color: Color = .gray
    
    private var isTrailingButton: Bool {
        !isLeadingButton
    }
    private var iconName: IconName {
        isLeadingButton ? .arrow_clockwise : .multiply_circle_fill
    }
    
    var body: some View {
        HStack {
            if isTrailingButton {
                Spacer()
            }
            
            Button {
                action()
            } label: {
                IconView(iconName: iconName, color: color)
            }
            .padding(.leading, MagicNumber.x)
            .padding(.trailing, MagicNumber.x)
            .scaleEffect(size)
            
            if isLeadingButton {
                Spacer()
            }
        }
    }
}
