//
//  GameWordView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 24.08.2022.
//

import SwiftUI

struct GameWordView: View {
    var gameWord: String
    static var minimum: CGFloat = 30
    let columns = [
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum)),
        GridItem(.adaptive(minimum: GameWordView.minimum))
    ]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(0..<gameWord.count, id: \.self) { index in
                    let character = gameWord[String.Index.init(utf16Offset: index, in: gameWord)]
                    Text(String(character))
                        .gameWordStyle()
                }
            }
        }
        .padding(.all, MagicNumber.x)
    }
}
