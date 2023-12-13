//
//  TodayView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

// Define a game structure that includes name, subtitle, and an image name
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let imageName: String
}

// Define categories for your games
struct ProductCategory: Identifiable {
    let id = UUID()
    let title: String
    let games: [Product]
}

// Sample data
let ProductCategories: [ProductCategory] = [
    ProductCategory(title: "Games", games: [
        Product(name: "Boş Yok", subtitle: "Control Mario with just a tap!", imageName: "bos-yok"),
        Product(name: "BiSohbet", subtitle: "Endless run with the Minions!", imageName: "bisohbet"),
        Product(name: "Kazan Kazan", subtitle: "Control Mario with just a tap!", imageName: "kazan-kazan"),
        Product(name: "Kim GB İster", subtitle: "Control Mario with just a tap!", imageName: "kim-gb-ister"),
        
        // Add more games here
    ]),
    ProductCategory(title: "Gift Box", games: [
        Product(name: "Çekilişe Katıl", subtitle: "Participate in our exciting contest for a chance to win fantastic prizes!", imageName: "cekilise-katil"),
        Product(name: "Migros 500 TL", subtitle: "Enjoy exclusive savings at Migros, Turkey's favorite grocery store.", imageName: "migros"),
        Product(name: "Netflix 200TL", subtitle: "Unlock endless entertainment with a 200 TL voucher for Netflix streaming services.", imageName: "netflix")
        
        // Add more games here
    ]),
    // Add more categories here
]

struct TodayView: View {
    @State private var isShowingDetail = false
    @State private var selectedProductName: String?
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                // Featured image at the top of the screen
                Image("banner2")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                ForEach(ProductCategories, id: \.id) { category in
                    VStack(alignment: .leading) {
                        Text(category.title)
                            .font(.title)
                            .padding(.leading)
                            .padding(.top, 20)
                        
                        ForEach(category.games, id: \.id) { game in
                            HStack {
                                Image(game.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(game.name)
                                        .font(.headline)
                                    Text(game.subtitle)
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    DispatchQueue.main.async {
                                        self.selectedProductName = game.name
                                        self.isShowingDetail = true
                                    }
                                }) {
                                    Text("Get")
                                        .foregroundColor(.blue)
                                        .frame(width: 60, height: 30)
                                        .background(Color(UIColor.systemGray5))
                                        .cornerRadius(15)
                                }
                            }
                            .padding(.horizontal)
                        }
                        Divider()
                            .padding(.vertical)
                    }
                }
            }.sheet(isPresented: $isShowingDetail, onDismiss: {
                // Reset the state when the sheet is dismissed
                self.selectedProductName = nil
            }) {
                // Check if the selected product is "Çekilişe Katıl" and show the appropriate view
                if selectedProductName == "Çekilişe Katıl" {
                    RaffleView()
                } else {
                    // Provide a generic detail view for other products or specific views based on the product name
                    Text("Details for \(selectedProductName ?? "the product")")
                }
            }
            
        }
    }
    
    // The view that represents the raffle detail screen
    struct RaffleView: View {
        @Environment(\.presentationMode) var presentationMode

        var body: some View {
            ZStack {
                // Dark background to mimic a modal effect
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)

                // Raffle content
                VStack(spacing: 20) {
                    // Close button at the top
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding()

                    Spacer()

                    // Raffle details
                    VStack(spacing: 16) {
                        Text("Çekiliş")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)

                        Image(systemName: "gift.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)

                        Text("Çekiliş ödülü, 500 TL Migros çeki!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                        Text("Migros'tan hediye çeki fırsatını kaçırma! 500 MetaByte ile çekilişe katılmak için tıkla!")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()

                        // Action buttons
                        HStack(spacing: 20) {
                            Button("Vazgeç") {
                                presentationMode.wrappedValue.dismiss()
                            }
                            .buttonStyle(RaffleButtonStyle())

                            Button("Dönüştür") {
                                // Perform action to convert or enter the raffle
                            }
                            .buttonStyle(RaffleButtonStyle())
                        }
                    }

                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.horizontal, 20)
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
                .padding(.horizontal, 20)
            }
        }
    }

    struct RaffleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(Color.green)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
    }
}

// SwiftUI Preview
struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
