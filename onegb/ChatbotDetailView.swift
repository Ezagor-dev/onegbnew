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

    @Binding var chatbot: CompanyChatbot
    @State private var newMessage: String = ""
    
    // Sample messages
    @State private var messages: [Messages]
    var updateChatbots: () -> Void
    
    init(chatbot: Binding<CompanyChatbot>, updateChatbots: @escaping () -> Void) {
            self._chatbot = chatbot
            self.updateChatbots = updateChatbots
            self._messages = State(initialValue: [
                Messages(id: 0, content: chatbot.wrappedValue.lastMessage, date: "Tuesday, Dec 15", company: chatbot.wrappedValue.name),
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
            .onAppear {
                        // Reduce the metaByteCount of the selected chatbot to zero
                        // and update the list in MessageListView
                chatbot.metaByteCount = 0
                            updateChatbots()
                    }
            .navigationBarTitle(Text(chatbot.name), displayMode: .inline)
            .padding()
        }
    }



