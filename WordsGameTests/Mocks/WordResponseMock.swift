//
//  WordResponseMock.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import Foundation
@testable import WordsGame

struct WordResponseMock {
    static func successResponse() -> WordResponse {
        return WordResponse(
            head: Head(),
            def: [Def(text: "text", pos: "pos", tr: [])]
        )
    }
    
    static func notSuccessResponse() -> WordResponse {
        return WordResponse(
            head: Head(),
            def: []
        )
    }
}
