//
//  GameStoreView.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import SwiftUI

enum Category: String, CaseIterable {
    case gameOfTheMonth = "Game of the Month"
    case triviaGames = "Trivia Games"
    case twoPlayerGames = "2 Player Games"
    case focusGames = "Focus Games"
    case luckGames = "Luck Games"
}

// Represents a game in the store
struct Game: Identifiable {
    let id = UUID()
    let name: String
    let reward: String
    let price: String
    let imageName: String // Assumes you have an image asset with this name
    let category: Category
}

// The GameStoreView that displays the game sections and their cards
let sampleGames: [Game] = [
    Game(name: "METABYTE ÇARKI", reward: "20 GB", price: "3 jeton", imageName: "cark2", category: .gameOfTheMonth),
    Game(name: "BOŞ YOK", reward: "2 GB", price: "1 jeton", imageName: "bosYok", category: .focusGames),
    Game(name: "Durdur Kazan", reward: "15 GB", price: "2 jeton", imageName: "durdurKazan", category: .focusGames),
    Game(name: "Yaklaş Kazan", reward: "15 GB", price: "2 jeton", imageName: "yaklasKazan", category: .triviaGames),
    Game(name: "Yaklaş Kazan", reward: "15 GB", price: "2 jeton", imageName: "sutKazan", category: .twoPlayerGames),
    Game(name: "Durdur Kazan", reward: "15 GB", price: "2 jeton", imageName: "durdurKazan", category: .luckGames)
    // Add more games here with respective categories...
]


// The GameStoreView that displays the game sections and their cards
struct GameStoreView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.black, Color("DarkGreen")]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(Category.allCases, id: \.self) { category in
                        GameSectionView(category: category, games: sampleGames.filter { $0.category == category })
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

// A view that represents a section of games
struct GameSectionView: View {
    let category: Category
    let games: [Game]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.rawValue)
                .font(.headline)
                .padding(.leading)
                .padding(.top, 10)
                .foregroundColor(.white)
                .shadow(color: .black,radius:3)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(games) { game in
                        GameCard(game: game)
                    }
                }
                .padding(.leading)
            }
        }
    }
}

// Custom view for game cards
struct GameCard: View {
    let game: Game
    
    var body: some View {
        VStack {
            Image(game.imageName) // Display the image from assets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 200)
            
            Text(game.name)
                .font(.caption)
                .foregroundColor(.white)
                .shadow(color: .black,radius:3)
            
            Text(game.reward)
                .font(.caption2)
                .foregroundColor(.green)
                .shadow(color: .green,radius:3)
            
            Text(game.price)
                .font(.caption2)
                .foregroundColor(.secondary)
                .shadow(color: .gray,radius:3)
        }
        .frame(width: 200, height: 250)
        .background(Color.gray.opacity(0.4))
        .cornerRadius(8)
    }
}



// Enum to represent different sections of the game store
enum GameSection: CaseIterable {
    case gameOfTheMonth, triviaGames, twoPlayerGames, focusGames, luckGames
    
    var title: String {
        switch self {
        case .gameOfTheMonth: return "Game of the Month"
        case .triviaGames: return "Trivia Games"
        case .twoPlayerGames: return "2 Player Games"
        case .focusGames: return "Focus Games"
        case .luckGames: return "Luck Games"
        }
    }
}

// Preview provider for SwiftUI previews
struct GameStoreView_Previews: PreviewProvider {
    static var previews: some View {
        GameStoreView()
    }
}

