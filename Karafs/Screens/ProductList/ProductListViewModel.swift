//
//  ProductListViewModel.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let productService: ProductService
    private let productPersister = ProductPersister.shared

    init(productService: ProductService = ProductService()) {
        self.productService = productService
        loadData()
    }

    func loadData() {
        if shouldFetchrProducts() {
            fetchProducts()
        } else {
            products = loadProductFromPersister()
        }
    }

    func fetchProducts() {
        isLoading = true
        errorMessage = nil

        productService.getProducts()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    self.isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = "Failed to load products: \(error.localizedDescription)"
                    }
                },
                receiveValue: { [weak self] products in
                    guard let self = self else { return }
                    self.products = products
                    saveFetchedProducts(products: products)
                }
            )
            .store(in: &cancellables)
    }

    func shouldFetchrProducts() -> Bool {
        productPersister.products.isEmpty
    }

    func loadProductFromPersister() -> [Product] {
        productPersister.products
    }

    func saveFetchedProducts(products: [Product]) {
        productPersister.products = products
    }
}
