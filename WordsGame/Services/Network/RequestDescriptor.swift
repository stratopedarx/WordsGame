//
//  RequestDescriptor.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire
import Foundation

struct RequestDescriptor: RequestDescriptorProtocol {
    // MARK: - Instance Properties
    
    let path: String
    let method: HTTPMethod
    let params: Parameters
    let encoding: ParameterEncoding
    let httpBody: Data?

    // MARK: - Initializers
    
    init(
        path: String,
        method: HTTPMethod,
        params: Parameters,
        encoding: ParameterEncoding,
        httpBody: Data? = nil
    ) {
        self.path = path
        self.method = method
        self.params = params
        self.encoding = encoding
        self.httpBody = httpBody
    }
}
