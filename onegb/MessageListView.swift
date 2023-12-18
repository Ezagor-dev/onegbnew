//
//  MessageListView.swift
//  onegb
//
//  Created by Ezagor on 15.12.2023.
//

import SwiftUI

struct HexagramShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width: CGFloat = min(rect.width, rect.height)
            let height = width
            let sideLength = width / 2
            let centerX = rect.midX
            let centerY = rect.midY
            
            let extraHeight = sideLength * tan(CGFloat.pi / 6)
            let points: [CGPoint] = [
                CGPoint(x: centerX, y: centerY - (height / 2)),
                CGPoint(x: centerX + sideLength / 2, y: centerY - extraHeight / 2),
                CGPoint(x: centerX + sideLength / 2, y: centerY + extraHeight / 2),
                CGPoint(x: centerX, y: centerY + (height / 2)),
                CGPoint(x: centerX - sideLength / 2, y: centerY + extraHeight / 2),
                CGPoint(x: centerX - sideLength / 2, y: centerY - extraHeight / 2)
            ]
            
            path.move(to: points[0])
            for point in points.dropFirst() {
                path.addLine(to: point)
            }
            path.closeSubpath()
        }
    }
}
// Define your chatbot/company model
struct CompanyChatbot: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    var metaByteCount: Int
    let logoName: String // The image name for the company's logo
}

// hexagram içerisine rakam koy metabyte count
// untaken metabyte sayısı unread topla
// gamebyte da verebilir hediye olarak 


// Define your MessageListViewa
struct MessageListView: View {
    @State private var selectedChatbot: CompanyChatbot? = nil
    
    @State private var chatbots: [CompanyChatbot]
    
    init() {
        // Sample data for the list
        _chatbots = State(initialValue: [
            CompanyChatbot(name: "Kazan Kazan", lastMessage: "Kazan Kazan 4 GB değerinde günün sorusu geldi...", metaByteCount: 15, logoName: "kazan-kazan"),
            CompanyChatbot(name: "Boş Yok!", lastMessage: "Boş Yok! 4 GB değerinde günün sorusu geldi...", metaByteCount: 14, logoName: "bos-yok"),
            CompanyChatbot(name: "BiSohbet", lastMessage: "BiSohbet 4 GB değerinde günün sorusu geldi...", metaByteCount: 13, logoName: "bisohbet"),
            CompanyChatbot(name: "Dinlet Kazan", lastMessage: "Dinlet Kazan 4 GB değerinde günün sorusu geldi...", metaByteCount: 12, logoName: "dinlet-kazan"),
            CompanyChatbot(name: "Kim 20 GB İster?", lastMessage: "Kim 20 GB İster? 4 GB değerinde günün sorusu geldi...", metaByteCount: 11, logoName: "kim-gb-ister"),
            CompanyChatbot(name: "Taraftar+", lastMessage: "Taraftar+ 4 GB değerinde günün sorusu geldi...", metaByteCount: 10, logoName: "taraftarplus"),
            CompanyChatbot(name: "Fenerbahçe Taraftar Kart", lastMessage: "Fenerbahçe Taraftar Kart 4 GB değerinde günün sorusu geldi...", metaByteCount: 9, logoName: "taraftarkart"),
            CompanyChatbot(name: "Şut ve Kazan", lastMessage: "Şut ve Kazan 4 GB değerinde günün sorusu geldi...", metaByteCount: 8, logoName: "sut-ve-kazan"),
            CompanyChatbot(name: "BiSohbet App", lastMessage: "BiSohbet App 4 GB değerinde günün sorusu geldi...", metaByteCount: 7, logoName: "bisohbet"),
            CompanyChatbot(name: "Kim GB İster App", lastMessage: "Kim GB İster App 4 GB değerinde günün sorusu geldi...", metaByteCount: 6, logoName: "kimgbisterapp"),
            CompanyChatbot(name: "Pepsi", lastMessage: "Pepsi 4 GB değerinde günün sorusu geldi...", metaByteCount: 5, logoName: "pepsi"),
            CompanyChatbot(name: "Tosla", lastMessage: "Tosla 4 GB değerinde günün sorusu geldi...", metaByteCount:4, logoName: "tosla"),
            CompanyChatbot(name: "Puan Harca", lastMessage: "Puan Harca 4 GB değerinde günün sorusu geldi...", metaByteCount: 3, logoName: "puanharca"),
            // Add other chatbots here
            // Your existing CompanyChatbot instances
        ].sorted(by: { $0.metaByteCount > $1.metaByteCount }))
    }
    
    var maxMetaByteCount: Int {
        chatbots.max(by: { $0.metaByteCount < $1.metaByteCount })?.metaByteCount ?? 0
    }
    
    var minMetaByteCount: Int {
        chatbots.min(by: { $0.metaByteCount < $1.metaByteCount })?.metaByteCount ?? 0
    }
    // Calculate the total untaken metaByteCount
        private var totalUntakenMetaByteCount: Int {
            chatbots.reduce(0) { $0 + $1.metaByteCount }
        }
    
    var body: some View {
        NavigationStack {
            List{
                // Display the total untaken metaByteCount at the top
                                Text("Total Untaken MetaByteCount: \(totalUntakenMetaByteCount)")
                                    .font(.headline)
                                    .padding()
                // List of chatbots
                ForEach(Array(chatbots.enumerated()), id: \.element.id) { index, _ in
                                NavigationLink(destination: ChatbotDetailView(chatbot: $chatbots[index], updateChatbots: self.updateChatbots)) {
                                    Button(action: {
                                        self.resetMetaByteCount(for: chatbots[index].name)
                                    }){
                                        ChatbotRow(chatbot: chatbots[index],
                                                   maxMetaByteCount: self.maxMetaByteCount,
                                                   minMetaByteCount: self.minMetaByteCount)
                                    }
                                }
                            }
                        }
                        .navigationTitle("Messages")
        }
    }
    private func updateChatbots() {
            chatbots.sort(by: { $0.metaByteCount > $1.metaByteCount })
        }
    
            private func resetMetaByteCount(for chatbotName: String) {
                if let index = chatbots.firstIndex(where: { $0.name == chatbotName }) {
                    chatbots[index].metaByteCount = 0
                    // Re-sort the chatbots after updating
                    chatbots.sort(by: { $0.metaByteCount > $1.metaByteCount })
                }
        }
        
        
            
        
    
    
    struct HexagonShape: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                let width = min(rect.width, rect.height)
                let height = width
                let sideLength = width / 2
                let angle = CGFloat.pi / 3
                
                let center = CGPoint(x: rect.midX, y: rect.midY)
                let radius = width / 2
                
                var points: [CGPoint] = []
                for i in 0..<6 {
                    let x = center.x + radius * cos(angle * CGFloat(i))
                    let y = center.y + radius * sin(angle * CGFloat(i))
                    points.append(CGPoint(x: x, y: y))
                }
                
                path.move(to: points[0])
                for point in points.dropFirst() {
                    path.addLine(to: point)
                }
                path.closeSubpath()
            }
        }
    }
    
    
    
    // Row view for each chatbot in the list
    struct ChatbotRow: View {
        var chatbot: CompanyChatbot
        var maxMetaByteCount: Int
        var minMetaByteCount: Int
        
        
        private func frameSize(for count: Int) -> CGFloat {
            // Define the minimum and maximum frame sizes
            let minFrameSize: CGFloat = 20
            let maxFrameSize: CGFloat = 50
            
            // Calculate the size proportionally
            if maxMetaByteCount == minMetaByteCount {
                // Avoid division by zero if all counts are the same
                return (minFrameSize + maxFrameSize) / 2
            } else {
                let proportion = CGFloat(count - minMetaByteCount) / CGFloat(maxMetaByteCount - minMetaByteCount)
                return minFrameSize + proportion * (maxFrameSize - minFrameSize)
            }
        }
        
        private func opacity(for count: Int) -> Double {
            // Opacity calculation
            let proportion = Double(count - minMetaByteCount) / Double(maxMetaByteCount - minMetaByteCount)
            // Ensure minimum opacity is not too low to keep hexagon visible
            let minOpacity = 0.01
            return minOpacity + proportion * (1 - minOpacity)
        }
        
        private func fontSize(for count: Int) -> CGFloat {
            // Define the minimum and maximum font sizes
            let minFontSize: CGFloat = 12
            let maxFontSize: CGFloat = 18
            
            // Calculate the font size proportionally
            if maxMetaByteCount == minMetaByteCount {
                return (minFontSize + maxFontSize) / 2
            } else {
                let proportion = CGFloat(count - minMetaByteCount) / CGFloat(maxMetaByteCount - minMetaByteCount)
                return minFontSize + proportion * (maxFontSize - minFontSize)
            }
        }
        
        
        var body: some View {
            HStack {
                Image(chatbot.logoName) // Replace with actual logo from your assets
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                
                
                VStack(alignment: .leading) {
                    Text(chatbot.name)
                        .font(.headline)
                    Text(chatbot.lastMessage)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                ZStack {
                    HexagonShape()
                        .fill(Color.green)
                        .opacity(opacity(for: chatbot.metaByteCount))
                    
                        .frame(width: frameSize(for: chatbot.metaByteCount),
                               height: frameSize(for: chatbot.metaByteCount))
                        .overlay(HexagonShape().stroke(Color.black, lineWidth: 1))
                    
                    Text("\(chatbot.metaByteCount)")
                        .foregroundColor(.black)
                        .font(.system(size: fontSize(for: chatbot.metaByteCount), weight: .bold))
                        .frame(width: frameSize(for: chatbot.metaByteCount),
                               height: frameSize(for: chatbot.metaByteCount),
                               alignment: .center)
                }
            }
        }
    }
    
    // Define the ChatView
    struct ChatView: View {
        var chatbot: CompanyChatbot
        
        var body: some View {
            Text("Chat view for \(chatbot.name)")
            // Here, build out the chat interface for interacting with the selected company's chatbot.
        }
    }
    
    // SwiftUI Preview
    struct MessageListView_Previews: PreviewProvider {
        static var previews: some View {
            MessageListView()
        }
    }
    
}
