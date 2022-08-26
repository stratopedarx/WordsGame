//
//  GWProgressView.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 26.08.2022.
//

import SwiftUI

struct GWProgressView: View {
    var scale: CGFloat = 2
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .red))
            .scaleEffect(scale)
    }
}
