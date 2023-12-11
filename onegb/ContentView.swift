//
//  ContentView.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import SwiftUI
import SafariServices
import AVKit

// tab view 
struct ContentView: View {
    @State private var isShowingSafariView = false
    
    var url = URL(string: "https://www.youtube.com/watch?v=W3aASjY-H9g")
    
    
    var body: some View {
        TabView {
            CampaignView()
                .tabItem {
                    Image(systemName: "megaphone.fill")
                    
                }
            Tap1View()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    
                }
            
            Tap2View()
                .tabItem {
                    Image(systemName: "gift.fill")
                    
                }
            
            Tap3View()
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    
                }
            
            Tap4View() 
                .tabItem {
                    Image(systemName: "network")
                    
                }
                
            
            
        }
    }
}

struct CampaignView: View {
    @State private var isShowingPopup = false
    @State private var isShowingSafariView = false
    var url = URL(string: "https://preview.codecanyon.net/item/in-orbit-html5-construct-game/full_screen_preview/36216337?_ga=2.266465802.585344652.1655104579-1885358847.1655104579")
    
    var surls2 = URL(string: "https://www.youtube.com/watch?v=W3aASjY-H9g")
    
    @State private var showTap4View = false
    
    
    var body: some View {
        VStack {
            Text("Campaign")
                .font(.body)
            
            // Add Image Carousel here
            Image("poster1")
                .resizable()
                .scaledToFit()
            
            HStack {
                Button(action: {
                    isShowingSafariView.toggle()
                }) {
                    Text("Play Now")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "07D3C9"))
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 3)
                }
                .padding(.horizontal)
                .sheet(isPresented: $isShowingSafariView) {
                    SafariViewController(url: url!)
                }
                
                
                Button(action: {
                    self.isShowingPopup.toggle()
                }) {
                    Text("Read 2 Win")
                }
                .sheet(isPresented: $isShowingPopup) {
                    PopupView()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            
            
            Text("Referral")
                .font(.body)
            // Placeholder for the image banner
            Image("poster2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
            
            Text("Winning Services")
                .font(.body)
            // Placeholder for the image banner
            Image("poster4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
            
            
            Button(action: {
                            self.showTap4View = true
                        }) {
                            Image("poster3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                        }
                        .sheet(isPresented: $showTap4View) {
                            Tap4View()
                        }
                    
            

        }
    }
}

struct Tap1View: View {
    var body: some View {
        VStack {
            
            
            // Add banner rectangle here
            
        
            
            // Placeholder for the image banner
            Image("poster2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        }
    }
}

struct Tap2View: View {
    var body: some View {
        VStack {
            VStack {
                Text("Ads")
                    .font(.largeTitle)
                Text("Winning Services")
                    .font(.largeTitle)
                
                // Add 5 images and See All option here
            }
        }
    }
}

struct Tap3View: View {
    var body: some View {
        VStack {
            Text("Ads")
                .font(.largeTitle)
            
            // Placeholder for the image banner
            Image("poster3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        }
    }
}


struct Tap4View: View {
    @State private var isShowingSafariView = false
    
    var surls2 = URL(string: "https://www.youtube.com/watch?v=W3aASjY-H9g")
    var surls3 = URL(string: "https://www.youtube.com/watch?v=1tZSbF2WILU")
    
    var body: some View {
        VStack {
            Text("Ads")
                .font(.body)
            Button(action: {
                isShowingSafariView.toggle()
            }){
                Image("poster3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
            }.sheet(isPresented: $isShowingSafariView) {
                SafariViewController(url: surls2!) // Replace 'yourURL' with the actual URL you want to open
            }
            Button(action: {
                isShowingSafariView.toggle()
            }){
                Image("poster3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
            }.sheet(isPresented: $isShowingSafariView) {
                SafariViewController(url: surls3!) // Replace 'yourURL' with the actual URL you want to open
            }
            
            
        }
    }
}


struct PopupView: View {
    var body: some View {
        ZStack {
            
            
            VStack(spacing:20) {
                Text("Win MateByte for every poster you read here!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                Image("popup1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7 * 9/16)
                
                Text("Here, you win free 1 MateByte just by reading an ad poster. For every poster you read here, you win 1 MateByte.")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    VStack {
                        Text("Read")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("3/10")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Won")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("3 MateByte")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
