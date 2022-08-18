//
//  BaseDataResponseSerializer.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire
import Foundation

final class BaseDataResponseSerializer: ResponseSerializer {
    func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Data {
        let statusCode = response?.statusCode ?? 0
        guard NetworkSuccessCodes.successCodes.contains(statusCode) else {
            throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: statusCode))
        }
        
        guard var data = data, !data.isEmpty else { return Data() }
        data = try dataPreprocessor.preprocess(data)
        return data
    }
}
