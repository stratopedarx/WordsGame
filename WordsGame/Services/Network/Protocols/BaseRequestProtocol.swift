//
//  BaseRequestProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Foundation

protocol BaseRequestProtocol: Codable, Hashable { }

extension BaseRequestProtocol {
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
}
