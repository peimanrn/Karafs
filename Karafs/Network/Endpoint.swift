//
//  Endpoint.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    func asURLRequest() throws -> URLRequest
}

public extension Endpoint {
    var baseURL: URL {
        AppConfig.shared.baseURL
    }

    var method: HTTPMethod {
        .post
    }

    var path: String {
        ""
    }

    var headers: HTTPHeaders? {
        HTTPHeaders()
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL
            .appendingPathComponent(path)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers?.dictionary
        return urlRequest
    }
}
