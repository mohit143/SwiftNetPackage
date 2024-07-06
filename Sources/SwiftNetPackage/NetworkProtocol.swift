//
//  NetworkProtocol.swift
//  SwiftNet
//
//  Created by mohit.mohit on 2024/07/05.
//

import Foundation

public typealias completionHandler = (Result<Data, NetworkError>) -> Void

public protocol NetworkProtocol {
    static var shared: NetworkProtocol { get }
    @available(iOS 13.0.0, *)
    func call(method: HTTPMethod, url: String, parameter: [String : Any]?, completion: completionHandler) async throws
}
