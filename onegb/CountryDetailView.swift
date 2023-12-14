//
//  CountryDetailView.swift
//  onegb
//
//  Created by Ezagor on 14.12.2023.
//

import SwiftUI

struct ESIMOffer: Identifiable {
    let id = UUID()
    let amount: String
    let validity: String
    let status: OfferStatus
}

enum OfferStatus: String {
    case active = "Active"
    case activeNext = "Active Next"
    case amountTooSmall = "Amount Too Small"
    case bonusPackage = "Bonus Package"
    case validityTooLow = "140.000 MTB"
    case enough = "30.000 MTB"
}

struct CountryDetailView: View {
    var country: Country
    let offers: [ESIMOffer] = [
        ESIMOffer(amount: "5 GB", validity: "Expires in 7 Days", status: .active),
        ESIMOffer(amount: "10 GB", validity: "Expires in 30 Days", status: .activeNext),
        ESIMOffer(amount: "20 GB", validity: "Expires in 30 Days", status: .enough),
        ESIMOffer(amount: "50 GB", validity: "Expires in 365 Days", status: .validityTooLow),
        // Add more offers as needed...
    ]

    var body: some View {
        NavigationView {
            List(offers) { offer in
                ESIMOfferRow(offer: offer)
            }
            .navigationBarTitle(Text("Select Offers"), displayMode: .inline)
            .listStyle(GroupedListStyle())
        }
        .accentColor(.green) // Or your theme color
    }
}

struct ESIMOfferRow: View {
    var offer: ESIMOffer

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(offer.amount)
                    .font(.headline)
                Text(offer.validity)
                    .font(.subheadline)
            }
            Spacer()
            Text(offer.status.rawValue)
                .foregroundColor(colorForStatus(offer.status))
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding(.vertical, 8)
    }

    func colorForStatus(_ status: OfferStatus) -> Color {
        switch status {
        case .active, .enough:
            return .green
        case .amountTooSmall, .validityTooLow:
            return .red
        case .bonusPackage:
            return .blue
        default:
            return .gray
        }
    }
}

// Replace your ContentView_Previews with the preview for CountryDetailView
struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country(name: "Turkey", flagEmoji: "🇹🇷"))
    }
}



