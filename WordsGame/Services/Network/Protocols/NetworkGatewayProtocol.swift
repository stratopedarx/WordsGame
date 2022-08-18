//
//  NetworkGatewayProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Combine
import Foundation

protocol NetworkGatewayProtocol {
    func data<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Data, NetworkError>
    func json<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<T.ResponseType, NetworkError>
    func json<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Void, NetworkError>
}
