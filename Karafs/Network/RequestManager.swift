//
//  RequestManager.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import UIKit
import Combine

protocol RequestManagerProtocol {
    func loadData<T: Codable>(
        endpoint: Endpoint,
        parameters: [String: Any]?
    ) -> AnyPublisher<T, NetError>
}

public class RequestManager: RequestManagerProtocol {

    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func loadData<T>(endpoint: Endpoint, parameters: [String: Any]?) -> AnyPublisher<T, NetError>
        where T: Decodable, T: Encodable {

        do {
            var request = try endpoint.asURLRequest()

            if let parameters {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }

            return client.getData(from: request)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    if let netError = error as? NetError {
                        return netError
                    } else {
                        return NetError.invalidData
                    }
                }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetError.invalidData).eraseToAnyPublisher()
        }
    }
}
