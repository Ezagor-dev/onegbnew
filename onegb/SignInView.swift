//
//  ContentView.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var navigateToContentView = false

    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                // Logo and Welcome Text
                
                Text("Welcome to")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "07D3C9"))
                    .shadow(color: .black,radius:3)
                
                Text("1GB app!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(Color(hex: "07D3C9"))
                    .shadow(color: .black,radius:3)
                
                Image("GB") // Make sure to add your logo image to your Assets with the name "LogoImage"
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                
                Text("1GB app is your entry ticket to the mobile world. Here, you can win and collect MateByte's and redeem them as GB whenever you need.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .fontWeight(.bold)
                
                Spacer()
                
               
                NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                            EmptyView()
                        }
                // Sign In Button
                Button(action: signIn) {
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "07D3C9"))
                        .cornerRadius(10)
                        .shadow(color: .black,radius:3)
                    
                }
                .padding(.horizontal)
                
                
                // Win MateByte Text
                Text("🎄 Win 45 MateByte as a welcome! 🎄")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                
                Spacer()
            }
            .background(Color.orange)
            .edgesIgnoringSafeArea(.all)
        }
    }
    

    func signIn() {
        // Handle the sign-in action
        navigateToContentView = true

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
