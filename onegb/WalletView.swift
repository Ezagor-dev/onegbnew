//
//  WalletView.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import SwiftUI

struct WalletView: View {
    // Sample data - replace with your actual data source
    let mateByteBalance: Int = 78000
    let gameByteBalance: Int = 35
    let transactionHistory: [Transaction] = [
        Transaction(date: "December 5", description: "Won from Memory Match", amount: "1.200 MateByte"),
        // Add more transactions here
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Daily login streak
               
                    
                
                // Wallet section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Wallet")
                        .font(.headline)
                    
                    Text("Check your balances, win, collect, redeem.")
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    BalanceCard(balance: mateByteBalance, unit: "M", color: .blue, title: "MateByte Balance", imageName: "GB")
                    
                    BalanceCard(balance: gameByteBalance, unit: "G", color: .orange, title: "GameByte Balance",imageName: "GB")
                }
                .padding()
                
                // Transaction history
                VStack(alignment: .leading) {
                    HStack {
                        Text("Your Transaction History")
                            .font(.headline)
                        Spacer()
                        Button("See All") {
                            // Action for see all button
                        }
                        .foregroundColor(.orange)
                    }
                    .padding([.leading, .trailing, .top])
                    
                    ForEach(transactionHistory) { transaction in
                        TransactionRow(transaction: transaction)
                    }.foregroundColor(.green)
                }
            }
        }
        .background(Color.gray.opacity(0.1)) // Light gray background for the whole view
    }
}

struct BalanceCard: View {
    let balance: Int
    let unit: String
    let color: Color
    let title: String
    let imageName: String // The name of the image in your asset catalog
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(imageName) // This will display the image from your assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60) // Adjust size as needed
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    
                    Text("\(balance)")
                        .font(.title)
                        .foregroundColor(color)
                    if unit == "M" { // Only show the redeem button for MateByte Balance
                        
                        Button("REDEEM 1.400 MateByte as 1 GB") {
                            // Redeem action
                        }
                        .buttonStyle(FilledButtonStyle(backgroundColor: color))
                        .padding(.leading)
                    }
                    
                }
                
                Spacer()
                
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            if unit == "M" { // Buttons for MateByte Balance
                HStack {
                    WalletActionButton(title: "SHARE", action: {})
                    WalletActionButton(title: "WIN MORE", action: {})
                    WalletActionButton(title: "GIFT BOX", action: {})
                }
            } else { // Buttons for GameByte Balance
                HStack {
                    WalletActionButton(title: "BUY", action: {})
                    WalletActionButton(title: "USE", action: {})
                }
            }
        }
    }
}

struct WalletActionButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(10)
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
    }
}


struct Transaction: Identifiable {
    let id = UUID()
    let date: String
    let description: String
    let amount: String
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.date)
                    .font(.subheadline)
                Text(transaction.description)
                    .font(.headline)
            }
            Spacer()
            Text(transaction.amount)
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding([.horizontal, .bottom])
    }
}

// SwiftUI Preview
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
