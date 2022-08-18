//
//  NetworkGateway.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire
import Combine
import UIKit

class NetworkGateway {
    // MARK: - Instance Properties
    
    private let sessionManager: Session
    private let responseSerializer = BaseDataResponseSerializer()
    private let baseURL: URL
    private let prefix: String
    private let adapters: [NetworkAdapterProtocol]
    private let queue: DispatchQueue = .init(
        label: String(describing: NetworkGatewayProtocol.self),
        qos: .background
    )
    
    // MARK: - Initializers
    
    init(
        sessionManager: Session,
        baseURL: URL,
        prefix: String,
        adapters: [NetworkAdapterProtocol]
    ) {
        self.sessionManager = sessionManager
        self.baseURL = baseURL
        self.prefix = prefix
        self.adapters = adapters
    }
}

// MARK: - Private Instance Methods

private extension NetworkGateway {
    func createURLRequest<T: NetworkRequestProtocol>(_ request: T) throws -> URLRequest {
        let requestDescriptor = request.getRequestDescriptor()
        let url = baseURL
            .appendingPathComponent(prefix)
            .appendingPathComponent(requestDescriptor.path)
        var urlRequest = try URLRequest(url: url, method: requestDescriptor.method)
        urlRequest = applyAdapter(urlRequest, requestDescriptor: requestDescriptor)
        
        urlRequest = try requestDescriptor.encoding.encode(urlRequest, with: requestDescriptor.params)
        
        if let httpBody = requestDescriptor.httpBody {
            urlRequest.httpBody = httpBody
        }
        
        return urlRequest
    }
    
    func applyAdapter(_ urlRequest: URLRequest, requestDescriptor: RequestDescriptorProtocol) -> URLRequest {
        var urlRequest = urlRequest
        adapters.forEach { adapter in
            let headers = adapter.header(descriptor: requestDescriptor)
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        return urlRequest
    }
    
    func handle(error: AFError) -> NetworkError {
        switch error {
        case .responseValidationFailed(let reason):
            return validationReason(reason)
        default:
            return NetworkError.alamofireError(error: error)
        }
    }
    
    func validationReason(_ reason: AFError.ResponseValidationFailureReason) -> NetworkError {
        switch reason {
        case .unacceptableStatusCode(let code):
            return NetworkError(code: code)
        default:
            return NetworkError.unknown
        }
    }
}

extension NetworkGateway: NetworkGatewayProtocol {
    func data<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Data, NetworkError> {
        guard Connectivity.isConnectedToInternet() else {
            return Fail(error: NetworkError.noConnection).eraseToAnyPublisher()
        }
        do {
            let request = try self.createURLRequest(request)
            return sessionManager
                .request(request)
                .publishResponse(using: responseSerializer, on: queue)
                .value()
                .mapError { [weak self] in
                    guard let self = self else { return .unknown }
                    return self.handle(error: $0)
                }
                .eraseToAnyPublisher()
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
            .mapError { $0 as? NetworkError ?? NetworkError.custom($0) }
            .eraseToAnyPublisher()
    }

    func json<T: NetworkRequestProtocol>(_ request: T) -> AnyPublisher<Void, NetworkError> {
        return data(request)
            .map { _ in return () }
            .eraseToAnyPublisher()
    }
}
