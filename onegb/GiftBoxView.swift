//
//  GiftBoxView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

enum GiftBoxCategory: String, CaseIterable {
    case subscriptions = "Subscriptions"
    case shoppers = "Gift Cards"
    case gamers = "Gamers"
    case ai = "AI"
    case coin = "Coin"
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




// The GiftBoxView that displays the gift box items sections and their cards
struct GiftBoxView: View {
    let sampleGifts: [Gift] = [
            Gift(name: "Youtube Premium", reward: "Get discounts", price: "2.000 MateBytes.", imageName: "youtube", category: .subscriptions),
            Gift(name: "Netflix", reward: "Get discounts", price: "3.000 MateBytes.", imageName: "netflix", category: .subscriptions),
            Gift(name: "Telegram Premium", reward: "Get discounts", price: "1.500 MateBytes.", imageName: "telegram-premium", category: .subscriptions),
            Gift(name: "BiSohbet Premium", reward: "Get discounts", price: "4.000 MateBytes.", imageName: "bisohbet2", category: .subscriptions),
            Gift(name: "iTunes Gift Card", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "itunes4", category: .shoppers),
            Gift(name: "Playstore Gift Card", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "playstore2", category: .shoppers),
            Gift(name: "ChatGPT", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "chatgpt", category: .ai),
            Gift(name: "Midjourney", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "midjourney", category: .ai),
            Gift(name: "Roblox", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "roblox2", category: .gamers),
            Gift(name: "BNB", reward: "Get discounts", price: "14.000 MateBytes.", imageName: "bnb", category: .coin),
            Gift(name: "Taraftar Kart", reward: "Get discounts", price: "7.000 MateBytes.", imageName: "taraftarkart", category: .subscriptions)
            // Add more gifts...
        ]
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color("DarkGreen")]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(GiftBoxCategory.allCases, id: \.self) { category in
                            GiftBoxSectionView(category: category, gifts: sampleGifts.filter { $0.category == category })
                        }
                    }
                }
                .navigationBarTitle("Gift Box", displayMode: .large)
                .navigationBarHidden(true)
            }
        }
    
}

// A view that represents a section of gift box items
struct GiftBoxSectionView: View {
    let category: GiftBoxCategory
    let gifts: [Gift]
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(category.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(gifts) { gift in
                            GiftCardView(gift: gift)
                        }
                    }
                    .padding(.horizontal)
                }
        }
    }
}

// Custom view for gift box item cards
struct GiftCardView: View {
    let gift: Gift  // Reusing the Game struct, replace with your Gift Box item struct if needed

    var body: some View {
        VStack {
            Image(gift.imageName) // Display the image from assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text(gift.name)
                .font(.caption)
                .foregroundColor(.white)
                .shadow(color: .black,radius:3)
            
            Text(gift.price)
                .font(.caption2)
                                .foregroundColor(.black)
                                .shadow(color: .white,radius:3)
        }
        .frame(width: 180, height: 200)
        .background(Color.gray.opacity(0.4))
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
