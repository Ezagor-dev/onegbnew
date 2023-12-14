//
//  OneSIM.swift
//  onegb
//
//  Created by Ezagor on 14.12.2023.
//

import SwiftUI

struct Country {
    var name: String
    var flagEmoji: String // Assuming you have flag images in your assets
}


struct Destination {
    var name: String
    var imageName: String
}

struct OneSIMView: View {
    @State private var selectedCountry: Country?
    @State private var showingDetail = false
    
    
    let countries = [
        Country(name: "Turkey", flagEmoji: "🇹🇷"),
        Country(name: "India", flagEmoji: "🇮🇳"),
        Country(name: "Greece", flagEmoji: "🇬🇷"),
        Country(name: "Italy", flagEmoji: "🇮🇹"),
        Country(name: "USA", flagEmoji: "🇺🇸"),
        Country(name: "UK", flagEmoji: "🇬🇧"),
        Country(name: "Serbia", flagEmoji: "🇷🇸"),
        Country(name: "China", flagEmoji: "🇨🇳")
        // Add more countries as needed
    ]
    let destinations = [
        Destination(name: "United Kingdom", imageName: "UK"),
        Destination(name: "USA", imageName: "USA"),
        Destination(name: "Serbia", imageName: "Serbia")
        // Add more destinations as needed
    ]
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                LinearGradient(gradient: Gradient(colors: [Color.black, Color("DarkGreen")]),
                               startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                // Content
                ScrollView {
                    VStack {
                        // User Profile & Balance
                        HStack {
                            UserProfileView(gbBalance: 35, mtbBalance: 78000)
                            Spacer()
                            MTBBalanceView(mtbBalance: 130000)
                        }
                        .padding()
                        
                        // Search and eSIM options
                        SearchAndESIMView()
                        
                        // Popular destinations
                        PopularDestinationsView(destinations: destinations)
                        
                        // Country selection
                        CountrySelectionView(countries: countries) { country in
                                    self.selectedCountry = country
                                    self.showingDetail = true
                                }
                        .popover(isPresented: $showingDetail) {
                            if let selectedCountry = selectedCountry {
                                CountryDetailView(country: selectedCountry)
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .accentColor(.green) // This sets the tint color for the entire navigation view
        }
    }
    
    // MARK: - Subviews
    struct UserProfileView: View {
        let gbBalance: Int
        let mtbBalance: Int
        
        var body: some View {
            HStack {
                Image(systemName: "person.circle") // Replace with actual profile image
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("\(gbBalance) GameByte")
                    Text("\(mtbBalance) MTB")
                }
                .foregroundColor(.white)
            }
        }
    }
    
    struct MTBBalanceView: View {
        let mtbBalance: Int
        
        var body: some View {
            Button(action: {
                //Gift box açılacak
            }) {
                HStack {
                    Text("\(mtbBalance) MTB")
                        .bold()
                    Image(systemName: "plus.circle.fill")
                }
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .foregroundColor(.white)
            }
        }
    }
    
    struct SearchAndESIMView: View {
        var body: some View {
            VStack {
                Text("Roam the world for less")
                    .font(.title)
                    .foregroundColor(.white)
                TextField("Enter your travel destination", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                HStack {
                    Button("Local eSIM", action: {})
                        .buttonStyle(FilledButtonStyleSIM())
                    Button("Regional eSIM", action: {})
                        .buttonStyle(FilledButtonStyleSIM())
                }
            }
        }
    }
    
    struct PopularDestinationsView: View {
        var destinations: [Destination]
        var body: some View {
            VStack(alignment: .leading) {
                Text("Popular")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading)
                // Horizontal scroll view for destinations
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(destinations, id: \.name) { destination in
                            DestinationCardView(destination: destination)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    struct DestinationCardView: View {
        var destination: Destination
        var body: some View {
            VStack {
                Image(destination.imageName) // Replace with actual image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 200)
                Text(destination.name)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
            }
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            .padding(5)
        }
    }
    
    struct CountrySelectionView: View {
        var countries: [Country]
        var selectCountry: (Country) -> Void
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Select a Country")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading)
                
                // Grid of countries
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    ForEach(countries, id: \.name) { country in
                        CountryButtonView(country: country) {
                                            selectCountry(country)
                                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    struct CountryButtonView: View {
        var country: Country
        var action: () -> Void
        var body: some View {
            Button(action: action) {
                HStack {
                    Text(country.flagEmoji)
                        .font(.largeTitle)
                    Text(country.name)
                        .fixedSize(horizontal: true, vertical: false)
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
    
    struct FilledButtonStyleSIM: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
        }
    }
    
    // MARK: - Previews
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            OneSIMView()
        }
    }
    
    
}
