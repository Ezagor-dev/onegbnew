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
            GameStoreView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    
                }
            
            GiftBoxView()
                .tabItem {
                    Image(systemName: "gift.fill")
                    
                }
            
            Tap3View()
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    
                }
            MateSimView()
                .tabItem {
                    Text("MateSIM")
                    Image(systemName: "network")
                    
                }
            
            Tap4View() 
                .tabItem {
                    Text("Ads")
                    Image(systemName: "film.fill")
                    
                }
            PushBoxView()
                .tabItem {
                    Text("PushBox")
                    Image(systemName: "greetingcard.fill")
                    
                }
            
            TodayView()
                .tabItem {
                    Text("Today")
                    Image(systemName: "cursorarrow.motionlines")
                    
                }
                
            //davet et kazan
            //loyalt
            //bip mesajlar kısmı pushboxview
            //last in first out
            // ne kazandığı belli olsun yanında
            // toplamda kaç metabyte kazandı bundan
            // toplamda o markadan kaç metabyte kazandı
            // katalogtaki marka kırılımları da burada görebilelim 
            
            // pepsi bir tane örnek trivia atar cevapla kazan clickable game
            // trivia soru da sorabilir banner yerine hangisi pepsi grubuna ait değildir bilirsen 5 bilemezsen 1 metabyte diye
            
            // boşyok diyelim bir spam ileti attı tıkladı kullanıcı ve sonrasında chatbot ekranında cevaplayabilsin oyunu oynasın boşyok bip akışı
            
            // kendi chatbot asistanımız olsun. kullanıcı bize soru sorarsa 0 metabyte, yapay zeka ile konuşursa 10 metabyte diyelim.
            //kullanıcı bize hollandaya gideceğim esim lazım derse ona göre akış gönderelim
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
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeaderView(title: "Campaign")
                
                Image("poster1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipped()
                
                HStack(spacing: 12) {
                    Spacer()
                    Button("Play Now") {
                        isShowingSafariView.toggle()
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: Color(hex: "07D3C9")))

                    Button("Read 2 Win") {
                        self.isShowingPopup.toggle()
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .orange))
                    Spacer()
                }
                
                .sheet(isPresented: $isShowingSafariView) {
                    SafariViewController(url: url!)
                }
                .sheet(isPresented: $isShowingPopup) {
                    PopupView()
                }

                SectionHeaderView(title: "Referral")
                
                Image("poster2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity) // Sets the width to fill the available space
                    .frame(height: 120) // Sets the fixed height of the image

                
                SectionHeaderView(title: "Winning Services")

                Image("poster4")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity) // Sets the width to fill the available space
                    .frame(height: 120) // Sets the fixed height of the image

                SectionHeaderView(title: "Ads")
                
                Button(action: {
                    self.showTap4View = true
                }) {
                    Image("poster3")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // Sets the width to fill the available space
                        .frame(height: 120) // Sets the fixed height of the image

                }
                .sheet(isPresented: $showTap4View) {
                    Tap4View()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.vertical, 2) // Reduced vertical padding
            .padding(.leading)
    }
}

struct CustomButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.15), radius: 3)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
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
                Text("Gift")
                    .font(.largeTitle)
                Text("Gift View or Redeem")
                    .font(.largeTitle)
                
                // Add 5 images and See All option here
            }
        }
    }
}

struct Tap3View: View {
    var body: some View {
        VStack {
            WalletView()
            
//            // Placeholder for the image banner
//            Image("poster3")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 200)
       }
    }
}

struct PushBoxView: View {
    var body: some View {
        VStack {
            WalletView()
            
//            // Placeholder for the image banner
//            Image("poster3")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 200)
       }
    }
}

struct MateSimView: View {
    var body: some View {
        VStack {
            CampaignView()
            
//            // Placeholder for the image banner
//            Image("poster3")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 200)
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
