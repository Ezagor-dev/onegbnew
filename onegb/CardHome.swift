//
//  CardHome.swift
//  onegb
//
//  Created by Ezagor on 14.12.2023.
//

import SwiftUI

struct CardHome: View {
    // View Properties
    
    @FocusState private var activeTF: ActiveKeyboardField!
    @State private var cardNumber: String = ""
    @State private var cardHolderNumber: String = ""
    @State private var cvvCode: String = ""
    @State private var expireDate: String = ""
    
    var body: some View {
        
        VStack{
            
            /// Header View
        
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Text("Add Card")
                    .font(.title3)
                    .padding(.leading,10)
                
                Spacer(minLength: 0)
                
                Button{
                    
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title2)
                }
            }
            CardView()
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
    /// Card View
    @ViewBuilder
    func CardView() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(.linearGradient(colors: [Color(.purple), Color(.green)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            // Card Details
            VStack(spacing:10){
                HStack{
                    TextField("XXXX XXXX XXXX XXXX",text: $cardNumber)
                        .font(.title3)
                        .keyboardType(.numberPad)
                        .focused($activeTF, equals: .cardNumber)
                }
            }
            .padding(20)
            .environment(\.colorScheme,.dark)
        }
        .frame(height:200)
        .padding(.top,35)
        
    }
}

#Preview {
    CardHome()
}
