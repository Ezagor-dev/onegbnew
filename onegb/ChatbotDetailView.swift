//
//  ChatbotDetailView.swift
//  onegb
//
//  Created by Ezagor on 15.12.2023.
//

import SwiftUI

// Define a simple message model
struct Messages: Identifiable {
    let id: Int
    let content: String
    let date: String
    let company: String
}

struct ChatbotDetailView: View {

    let chatbot: CompanyChatbot
    @State private var newMessage: String = ""
    
    // Sample messages
    @State private var messages: [Messages]
    
    init(chatbot: CompanyChatbot) {
        self.chatbot = chatbot
        _messages = State(initialValue: [
            Messages(id: 0, content: chatbot.lastMessage, date: "Tuesday, Dec 15", company: chatbot.name),
            // ... add more messages
        ])
    }
    
    
    
    var body: some View {
            VStack {
                ForEach(messages) { message in
                    VStack(alignment: .leading) {
                        Text(message.company)
                            .font(.title)
                        Text(message.content).fixedSize(horizontal: false, vertical: true) // Allows for multiline text
                            .font(.body)
                        Text(message.date)
                            .font(.subheadline)
                                                    .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle(Text(chatbot.name), displayMode: .inline)
            .padding()
        }
    }

struct ChatbotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatbotDetailView(chatbot: CompanyChatbot(name: "Kazan Kazan", lastMessage: "Sample last message", metaByteCount: 15, logoName: "kazan-kazan"))
        }
    }
}
