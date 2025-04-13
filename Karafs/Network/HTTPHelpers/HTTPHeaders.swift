//
//  HTTPHeaders.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

public struct HTTPHeaders {
    private var headers: [HTTPHeader] = []

    public init(headers: [HTTPHeader] = Self.default) {
        self.headers = headers
    }

    public mutating func add(header: HTTPHeader) {
        headers.append(header)
    }

    public mutating func remove(header: HTTPHeader) {
        headers.removeAll { $0 == header }
    }

    public var dictionary: [String: String] {
        Dictionary(uniqueKeysWithValues: headers.map { ($0.name, $0.value) })
    }
}

extension HTTPHeaders {
    public static var `default`: [HTTPHeader] {
        let defaultHeaders: [HTTPHeader] = [
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Accept-Language", value: "en-US")
        ]

        return defaultHeaders
    }
}
