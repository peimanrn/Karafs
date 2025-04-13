//
//  HTTPClient.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import UIKit
import Combine

public protocol HTTPClient {
    func getData(from request: URLRequest) -> AnyPublisher<Data, NetError>
}
