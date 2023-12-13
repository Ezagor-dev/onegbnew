//
//  PushBoxSpamView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

struct Message: Identifiable, Codable {
    var id = UUID()
    let sender: String
    let content: String
    let date: String
    let metabyteCount: Int
    let imageName: String
    var played: Bool=false
    
    init(id: UUID = UUID(), sender: String, content: String, date: String, metabyteCount: Int, imageName: String, played: Bool = false) {
            self.id = id
            self.sender = sender
            self.content = content
            self.date = date
            self.metabyteCount = metabyteCount
            self.imageName = imageName
            self.played = played
        }
}

struct PushBoxSpamView: View {
    // Sample data
    let messages: [Message] = [
        Message(sender: "Pepsi", content: "We've been working to improve your...", date: "1:23 PM", metabyteCount: 15,imageName: "pepsi"),
        Message(sender: "Boş Yok", content: "3 GB SAKLI BARDAK SENİ BEKLİYOR! 🤩🎁 Tıkla, kazanmaya devam et!🎊👇", date: "Yesterday", metabyteCount: 10,imageName: "bos-yok"),
        // ... add more messages here
    ]
    @State private var showClickableGameView = false
        @State private var selectedMessage: Message?
    
    var body: some View {
        NavigationView {
            List(messages) { message in
                Button(action: {
                    self.selectedMessage = message
                    if message.sender == "Boş Yok" {
                        self.showClickableGameView = true
                    }else if message.sender == "Pepsi" {
                        self.showClickableGameView = true
                    }
                }) {
                    HStack {
                        // Sender's image or icon
                        Image(message.imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(5)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(message.sender)
                                .font(.headline)
                            Text(message.content)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text(message.date)
                                .font(.caption)
                                .foregroundColor(.gray)
                            if message.metabyteCount > 0 {
                                Text("\(message.metabyteCount)")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .background(Color.green)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Push Box")
            .sheet(isPresented: $showClickableGameView) {
                if let selectedMessage = selectedMessage, selectedMessage.sender == "Boş Yok" {
                    ClickableGameView(
                        header: "Which is the correct one?",
                        description: "Make your choice!",
                        options: ["Option A", "Option B", "Option C"],
                        correctOption: "Option B",
                        brand: selectedMessage.sender,
                        banner:"soru1"
                    )
                }
                else if let selectedMessage = selectedMessage, selectedMessage.sender == "Pepsi" {
                    ClickableGameView(
                        header: "Hangisi Pepsi ürünü değildir?",
                        description: "Make your choice!",
                        options: ["Lays", "Pepsi", "CocoCola"],
                        correctOption: "CocoCola",
                        brand: selectedMessage.sender,
                        banner:"pepsi"
                    )
                }
            }
        }
    }
}

struct PushBoxSpamView_Previews: PreviewProvider {
    static var previews: some View {
        PushBoxSpamView()
    }
}
