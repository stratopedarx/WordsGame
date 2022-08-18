//
//  RequestDescriptorProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire
import Foundation

protocol RequestDescriptorProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var params: Parameters { get }
    var encoding: ParameterEncoding { get }
    var httpBody: Data? { get }
}
