//
//  BaseResponseProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Foundation

protocol BaseResponseProtocol: Codable, Hashable { }

extension BaseResponseProtocol {
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
}
