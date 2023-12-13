//
//  ClickableGameView.swift
//  onegb
//
//  Created by Ezagor on 13.12.2023.
//

import SwiftUI

//https://github.com/SDWebImage/SDWebImageSwiftUI

struct ClickableGameView: View {
    let header: String
    let description: String
    let options: [String]
    let correctOption: String
    @State private var selectedOption: String?
    @State private var feedbackMessage: String?
    @State private var metabytePoints: Int = 0
    
    var body: some View {
        VStack {
            Text(header)
                .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .fixedSize(horizontal: false, vertical: true) // Allow the text to wrap and grow vertically

            
            // Replace "game-image" with your actual image or gif name in the assets
            Image("soru.gif")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
            
            Text(description)
                .font(.body)
                .padding()
            
            // Option buttons
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                self.selectedOption = option
                            }) {
                                Text(option)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(self.selectedOption == option ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 2)
                        }
            
            // Feedback message
            if let feedbackMessage = feedbackMessage {
                Text(feedbackMessage)
                    .padding()
            }
            
            // Action button to "BUL KAZAN"
            Button("BUL KAZAN") {
                if self.selectedOption != nil {
                    self.checkAnswer()
                } else {
                    self.feedbackMessage = "Please select an option first."
                }
            }
            .disabled(selectedOption == nil)
            .padding()
            .background(selectedOption != nil ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Display metabyte points
            Text("Metabyte Points: \(metabytePoints)")
                .padding()
        }
        .padding()
    }
    
    // Function to check the answer and provide feedback
    private func checkAnswer() {
        if let selectedOption = selectedOption {
            if selectedOption == correctOption {
                feedbackMessage = "You are correct and you earn 10 metabyte points."
                metabytePoints += 10
            } else {
                feedbackMessage = "That’s not the correct answer, but keep trying!"
                metabytePoints += 1
            }
        }
    }
}

struct ClickableGameView_Previews: PreviewProvider {
    static var previews: some View {
        ClickableGameView(
            header: "Hangisi Bir Pepsi Markası Değildir ?",
            description: "Hemen seçimini yap!",
            options: ["Lays", "Pepsi", "CocoCola"],
            correctOption: "CocoCola" // Replace with the actual correct option
        )
    }
}
