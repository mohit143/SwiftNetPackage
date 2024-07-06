//
//  Network.swift
//  SwiftNet
//
//  Created by mohit.mohit on 2024/07/05.
//

import Foundation

public class Network: NetworkProtocol {
    public static var shared: NetworkProtocol = Network()
    let validStatus = 200...299
    
    public func call(method: HTTPMethod, url: String, parameter: [String : Any]?, completion: completionHandler) async throws {
        let urlRequest = self.prepareRequest(method, url: url, parameter: parameter)
        
        if urlRequest != nil {
            guard let (data, response) = try await URLSession.shared.data(for: urlRequest!, delegate: nil) as? (Data, HTTPURLResponse), validStatus.contains(response.statusCode) else {
                completion(.failure(.empty()))
                
                throw NetworkError.empty()
            }
            
            completion(.success(data))
        }
    }

    private func prepareRequest(_ method: HTTPMethod, url: String, parameter: [String: Any]?) -> URLRequest? {
        guard let request = url.toURLRequest else {
            return nil
        }
        
        return request
    }

}

extension String {
    var toURL: URL? {
        return URL(string: self)
    }

    var toURLRequest: URLRequest? {
        guard let url = self.toURL else { return nil }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
