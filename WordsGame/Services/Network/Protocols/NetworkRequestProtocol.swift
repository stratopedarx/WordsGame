//
//  NetworkRequest.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Foundation

protocol NetworkRequestProtocol {
    associatedtype ResponseType: Decodable
    func getRequestDescriptor() -> RequestDescriptorProtocol
}
