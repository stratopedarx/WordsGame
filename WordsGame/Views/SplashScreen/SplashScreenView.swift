//
//  SplashScreenView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import SwiftUI

struct SplashScreenView<Content>: View where Content: View {
    @State var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var color: Color = .blue.opacity(0.8)
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        if isActive {
            content()
        } else {
            VStack {
                VStack {
                    IconView(iconName: .scribble_variable, fontSize: 80, color: color, weight: .bold)
                    Text(Localizable.wordsGameTitle.localized)
                        .modifier(PrimaryFontStyle(size: MagicNumber.x5, color: color, weight: .bold))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
