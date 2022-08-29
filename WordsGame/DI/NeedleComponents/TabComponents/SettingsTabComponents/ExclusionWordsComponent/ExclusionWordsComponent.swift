//
//  ExclusionWordsComponent.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import NeedleFoundation
import SwiftUI

protocol ExclusionWordsComponentProtocol {
    func buildView() -> AnyView
}

protocol ExclusionWordsDependency: Dependency { }

final class ExclusionWordsComponent: Component<ExclusionWordsDependency>, ExclusionWordsComponentProtocol {
    func buildView() -> AnyView {
        AnyView(
            ExclusionWordsView(viewModel: ExclusionWordsViewModel())
        )
    }
}
