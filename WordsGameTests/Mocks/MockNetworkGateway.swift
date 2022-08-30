//
//  MockNetworkGateway.swift
//  WordsGameTests
//
//  Created by Sergey Lobanov on 30.08.2022.
//

import Alamofire
import Combine
import Foundation
@testable import WordsGame

final class MockNetworkGateway: NetworkGatewayProtocol {
    func data<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Data, NetworkError> {
        do {
            let response = Data()
            let data = try JSONDecoder().decode(Data.self, from: response)
            return Future { promise in
                promise(.success(data))
            }.eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }
    }

    func json<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<T.ResponseType, NetworkError> {
        return data(request)
            .tryMap {
                let object = try JSONDecoder().decode(T.ResponseType.self, from: $0)
                return object
            }
            .mapError { NetworkError.custom($0) }
            .eraseToAnyPublisher()
    }

    public func json<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Void, NetworkError> {
        return data(request)
            .mapError { NetworkError.custom($0) }
            .map { _ in return () }
            .eraseToAnyPublisher()
    }
}
