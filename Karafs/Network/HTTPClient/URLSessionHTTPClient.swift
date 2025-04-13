//
//  URLSessionHTTPClient.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import UIKit
import Combine

class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getData(from request: URLRequest) -> AnyPublisher<Data, NetError> {
        session.dataTaskPublisher(for: request)
            .tryMap { output in
                guard
                    let httpResponse = output.response as? HTTPURLResponse,
                    (200..<300).contains(httpResponse.statusCode) else {
                    throw NetError.invalidData
                }
                return output.data
            }
            .mapError { error in
                if let netError = error as? NetError {
                    return netError
                } else {
                    return NetError.networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
