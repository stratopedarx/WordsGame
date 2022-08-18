//
//  NetworkAdapterProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Foundation

protocol NetworkAdapterProtocol {
    func header(descriptor: RequestDescriptorProtocol) -> [String: String]
}
