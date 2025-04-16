//
//  ProductService.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation
import Combine

class ProductService {
    private let httpClient: URLSessionHTTPClient
    private let requestManger: RequestManager

    init() {
        self.httpClient = URLSessionHTTPClient()
        self.requestManger = RequestManager(client: httpClient)
    }

    func getProducts() -> AnyPublisher<[Product], NetError> {
        requestManger.loadData(endpoint: ProductEndpoint.all, parameters: nil)
            .map { (response: ProductResponse) in
                response.products
            }
            .eraseToAnyPublisher()
    }
}
