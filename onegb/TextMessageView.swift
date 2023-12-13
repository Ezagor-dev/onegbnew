//
//  TextMessageView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

struct ChatMessageText: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool // Determine if the message is from the user or the system
}
struct TextMessageView: View {
    let header: String
    let description: String
    let brand: String
    
    @State private var selectedOption: String?
    @State private var messages: [String] = []
    @State private var gamePlayed = false
    @State private var metabytePoints: Int = 0

    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    MessageBubbleText(message: message, isUser: message.contains("You are correct") || message.contains("Not quite right"))
                }
            }
            
            if !gamePlayed {
                // Game question and options
                VStack {
                    Text(header)
                        .font(.headline)
                        .padding()
                    
                    
                    
                    Text(description)
                        .font(.body)
                        .padding()
                    
                   
                    
                    Button("BAŞLA") {
                        
                        
                        
                        metabytePoints += 1
                        gamePlayed = true
                        // Append system message about Metabyte points
                        let systemMessage = "\(brand) rewarded you \(metabytePoints) Metabyte points!"
                        messages.append(systemMessage)
                    }
                    .disabled(selectedOption == nil)
                    .padding()
                    .background(selectedOption != nil ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            }
            // Display total metabyte points
            Text("Total Metabyte Points: \(metabytePoints)")
                .padding()
        }
        .padding()
        .navigationTitle("Game Chat")
    }
    
    
}

struct MessageBubbleText: View {
    var message: String
    var isUser: Bool
    
    var body: some View {
        HStack {
            if isUser { Spacer() }
            Text(message)
                .padding()
                .background(isUser ? Color.blue : Color.secondary.opacity(0.1))
                .foregroundColor(isUser ? .white : .black)
                .cornerRadius(15)
            if !isUser { Spacer() }
        }
        .transition(.move(edge: isUser ? .trailing : .leading))
    }
}

struct TextMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TextMessageView(
            header: "Which is the correct one",
            description: "Make your choice!",
            brand: "BoşYok"
            
        )
    }
}
