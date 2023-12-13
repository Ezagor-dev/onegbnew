//
//  PushBoxSpamView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let content: String
    let date: String
    let metabyteCount: Int
    let imageName: String
}

struct PushBoxSpamView: View {
    // Sample data
    let messages: [Message] = [
        Message(sender: "Pepsi", content: "We've been working to improve your...", date: "1:23 PM", metabyteCount: 10,imageName: "pepsi"),
        Message(sender: "Boş Yok", content: "3 GB SAKLI BARDAK SENİ BEKLİYOR! 🤩🎁 Tıkla, kazanmaya devam et!🎊👇", date: "Yesterday", metabyteCount: 5,imageName: "bos-yok"),
        // ... add more messages here
    ]
    
    var body: some View {
        NavigationView {
            List(messages) { message in
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
            .navigationBarTitle("Push Box")
        }
    }
}

struct PushBoxSpamView_Previews: PreviewProvider {
    static var previews: some View {
        PushBoxSpamView()
    }
}
