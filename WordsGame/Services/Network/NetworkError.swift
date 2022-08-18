//
//  NetworkError.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire
import Foundation

enum NetworkError: Error {
    case alamofireError(error: AFError)
    case custom(Error)
    case internalServerError
    case invalidJSON
    case invalidRequest
    case noConnection
    case unknownCode(Int)
    case unknown
}

// MARK: - NetworkError Init

extension NetworkError {
    init(code: Int) {
        switch code {
        case 500:
            self = .internalServerError
        default:
            self = .unknownCode(code)
        }
    }
}

// MARK: - NetworkError Description

extension NetworkError {
    var errorDescription: String {
        switch self {
        case .alamofireError(let error):
            return "\(Localizable.alamofireError.localized)\(error.localizedDescription)"
        case .custom(let error):
            guard let error = error as? NetworkError else {
                return "\(Localizable.custom.localized)\(error.localizedDescription)"
            }
            return error.errorDescription
        case .internalServerError:
            return Localizable.internalServerError.localized
        case .invalidJSON:
            return Localizable.invalidJSON.localized
        case .invalidRequest:
            return Localizable.invalidRequest.localized
        case .noConnection:
            return Localizable.noConnection.localized
        case .unknownCode(let code):
            return "\(Localizable.unknownCode.localized)\(code)"
        default:
            return Localizable.unknown.localized
        }
    }
}

// MARK: - NetworkError Equatable

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.errorDescription == rhs.errorDescription
    }
}
