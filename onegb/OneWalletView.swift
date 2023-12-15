//
//  OneWalletView.swift
//  onegb
//
//  Created by Ezagor on 14.12.2023.
//

import SwiftUI

struct OneWalletView: View {
    @State private var isAddingCard = false
    @State private var isShowingWalletView = false

    var body: some View {
        NavigationStack{
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.black]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                // Floating bubbles might be replaced with your custom UI elements
                floatingBubbles()
                
                VStack {
                    Spacer()
                    
                    // Card representation
                    // Card representation
                    VStack {
                        HStack {
                            Spacer()
                            Image("card3") // Replace "card3" with your actual card image name
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 200) // Adjust the frame size as needed
                                .cornerRadius(5)
                            Spacer()
                        }
                        .cornerRadius(5)
                        .shadow(radius: 10)
                        .padding(.horizontal) // Add horizontal padding to prevent the card from stretching to screen edges

                        Text("Make payments much easier by using all your cards in one place")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    Spacer()
                    
                    // Action buttons
                    HStack {
                        skipButton
                        addButton
                    }
                    

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $isShowingWalletView) {
                            WalletView() // Pass any required parameters to WalletView
                        }
                        .sheet(isPresented: $isAddingCard) {
                            CardHome().preferredColorScheme(.light) // Make sure CardHome is ready for production
                        }
        }
    }
    
    // Floating bubbles function for background
    func floatingBubbles() -> some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.purple.opacity(0.5))
                    .blur(radius: 80)
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.2)
                
                Circle()
                    .fill(Color.blue.opacity(0.4))
                    .blur(radius: 100)
                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.1)
                
                Circle()
                    .fill(Color.green.opacity(0.3))
                    .blur(radius: 150)
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.9)
            }
        }
    }
    
    var skipButton: some View {
            Button(action: {
                isShowingWalletView = true
            }) {
                Text("Skip")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
        }

        // Add card button
        var addButton: some View {
            Button(action: { isAddingCard.toggle() }) {
                Text("+ Add your card win 10.000 MetaByte")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
            }
        }
}

struct OneWalletView_Previews: PreviewProvider {
    static var previews: some View {
        OneWalletView()
    }
}

