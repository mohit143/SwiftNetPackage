//
//  NetworkError.swift
//  SwiftNet
//
//  Created by mohit.mohit on 2024/07/05.
//

import Foundation

public struct NetworkError: Codable, Error {
    public let message: String
    public let code: Int

    public static let unableToCreateRequest = {
        return NetworkError(message: "Unable to create url request", code: 1001)
    }

    public static var empty = {
        return NetworkError(message: "Empty data", code: 1002)
    }
}
