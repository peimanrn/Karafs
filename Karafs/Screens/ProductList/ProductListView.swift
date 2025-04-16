//
//  ProductListView.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading products...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                        Text(error)
                            .font(.headline)
                        Button("Retry") {
                            viewModel.fetchProducts()
                        }
                    }
                    .padding()
                } else {
                    List(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRow(product: product)
                                .padding(.vertical, 8)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Products 🛒")
        }
    }
}

#Preview {
    ProductListView()
}
