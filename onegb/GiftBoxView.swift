//
//  GiftBoxView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

enum GiftBoxCategory: String, CaseIterable {
    case subscriptions = "Subscriptions"
    case shoppers = "Shoppers"
    case gamers = "Gamers"
    case tvMusicLovers = "TV & Music Lovers"
    // Add more categories if needed
}

struct Gift: Identifiable {
    let id = UUID()
    let name: String
    let reward: String
    let price: String
    let imageName: String // Assumes you have an image asset with this name
    let category: GiftBoxCategory
}


// Sample data for gift box items, categorized
let sampleGiftBoxItems: [Gift] = [
    Gift(name: "₺200 MARKET COUPON", reward: "Get discounts", price: "with your MateByte's.", imageName: "market-coupon", category: .subscriptions),
    // Add more gift box items with respective categories...
]

// The GiftBoxView that displays the gift box items sections and their cards
struct GiftBoxView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Gift Box")
                    .font(.largeTitle)
                    .padding()

                Text("You collected your MateByte's? Here's your prizes for them.")
                    .font(.headline)
                    .padding([.leading, .trailing, .bottom])

                // Iterate over each category to display its items
                ForEach(GiftBoxCategory.allCases, id: \.self) { category in
                    GiftBoxSectionView(category: category, items: sampleGiftBoxItems.filter { $0.category == category })
                }
            }
        }
    }
}

// A view that represents a section of gift box items
struct GiftBoxSectionView: View {
    let category: GiftBoxCategory
    let items: [Gift]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(category.rawValue)
                    .font(.headline)
                    .padding(.leading)
                    .padding(.top, 10)
                Spacer()
                Button("See All") {
                    // Action for see all button
                }
                .foregroundColor(.orange)
                .padding(.trailing)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(items) { item in
                        GiftBoxItemCard(item: item)
                    }
                }
                .padding(.leading)
            }
        }
    }
}

// Custom view for gift box item cards
struct GiftBoxItemCard: View {
    let item: Gift  // Reusing the Game struct, replace with your Gift Box item struct if needed

    var body: some View {
        VStack {
            Image(item.imageName) // Display the image from assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text(item.name)
                .font(.caption)
                .foregroundColor(.primary)
            
            Text(item.price)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 180, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.bottom, 10)
    }
}

// Define the Category enum if you haven't already done so in your GameStoreView code.

// Preview provider for SwiftUI previews
struct GiftBoxView_Previews: PreviewProvider {
    static var previews: some View {
        GiftBoxView()
    }
}
