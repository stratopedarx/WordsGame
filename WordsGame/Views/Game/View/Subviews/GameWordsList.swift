//
//  GameWordsList.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 28.08.2022.
//

import SwiftUI

struct GameWordsList: View {
    var gameCells: [GameCell] = []
    let widthTitleColumn: CGFloat = UIScreen.main.bounds.size.width * 0.30
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(gameCells) { cell in
                    HStack {
                        Text("\(cell.name): ")
                            .frame(maxWidth: widthTitleColumn, alignment: .leading)
                            .lineLimit(1)
                        
                        Text("\(cell.word) \(cell.word.count)")
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal, MagicNumber.x)
                    .titleStyle(fontSize: MagicNumber.x2, colorShadow: cell.color)
                    .padding(.bottom, MagicNumber.x)
                }
            }
            .padding(.vertical, MagicNumber.x2)
        }
    }
}
