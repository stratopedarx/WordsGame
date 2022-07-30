//
//  ContentView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 25.06.2022.
//

import SwiftUI

struct MainView: View {
    @State var mainWord = ""
    @State var player1Name = ""
    @State var player2Name = ""
    @State var player3Name = ""
    @State var player4Name = ""
    @State var isShowGameView = false

    var body: some View {
        VStack {
            GameTextView(placeholder: .mainPlaceholder, text: $mainWord, topPadding: MagicNumber.x8)
            GameTextView(placeholder: .player1, text: $player1Name)
            GameTextView(placeholder: .player2, text: $player1Name, topPadding: MagicNumber.x2)
            StartButtonView(title: .start, action: { isShowGameView = true })
        }
        .background(Image("background"))
        .fullScreenCover(isPresented: $isShowGameView) {
            GameView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
