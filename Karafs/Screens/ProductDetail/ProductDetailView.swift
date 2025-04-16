//
//  ProductDetailView.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var viewModel: ProductDetailViewModel

    init(product: Product) {
        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(product: product))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                productImage
                titleAndRating
                priceAndDiscount
                stockInfo
                productDescription
            }
            .padding(.top)
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
    }

    private var productImage: some View {
        ProductImage(url: viewModel.thumbnailURL, rating: viewModel.rating, size: 150)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            .padding(.vertical, 64)
    }

    private var titleAndRating: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(viewModel.title)
                .font(.title2)
                .fontWeight(.bold)
            ratingStars
        }
        .padding(.horizontal)
    }

    private var ratingStars: some View {
        HStack(spacing: 2) {
            ForEach(0..<viewModel.fullStars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(ratingColor)
            }

            if viewModel.hasHalfStar {
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(ratingColor)
            }

            ForEach(0..<(5 - viewModel.fullStars - (viewModel.hasHalfStar ? 1 : 0)), id: \.self) { _ in
                Image(systemName: "star")
                    .foregroundColor(.gray.opacity(0.3))
            }

            Text(String(format: "%.1f", viewModel.rating))
                .foregroundColor(.secondary)
                .font(.caption)
        }
    }

    private var priceAndDiscount: some View {
        HStack(spacing: 12) {
            VStack(alignment: .center, spacing: 4) {
                if let originalPrice = viewModel.formattedOriginalPrice {
                    Text("\(originalPrice) $")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .strikethrough()
                }

                Text("\(viewModel.formattedDiscountedPrice) $")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
            }

            if let discount = viewModel.discountPercentageText {
                Text(discount)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red.opacity(0.15))
                    .foregroundColor(.red)
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal)
    }

    private var stockInfo: some View {
        HStack {
            Image(systemName: "cube.box.fill")
            Text(viewModel.stockInfoText)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding(.horizontal)
    }

    private var productDescription: some View {
        Group {
            if let description = viewModel.productDescription {
                Text(description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
            }
        }
    }

    var ratingColor: Color {
        if viewModel.rating <= 3.0 {
            return .red
        } else if viewModel.rating < 4.0 {
            return .orange
        } else {
            return .green
        }
    }
}

#Preview {
    ProductDetailView(product: Product.dummyData)
}
