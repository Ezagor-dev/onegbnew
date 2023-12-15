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
    @State private var cardHolderName: String = ""
    @State private var cvvCode: String = ""
    @State private var expireDate: String = ""
    
    var body: some View {
        
        NavigationStack{
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
                
                Button{
                    
                }label: {
                    Label("Add Card", systemImage: "lock")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,12)
                        .frame(maxWidth:.infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(.blue.gradient)
                        }
                }
                .disableWithOpacity(cardNumber.count != 19 || expireDate.count != 5 || cardHolderName.isEmpty || cvvCode.count != 3)
            }
            .padding()
            .toolbar(.hidden, for:.navigationBar)
            .toolbar{
                ToolbarItem(placement: .keyboard){
                    
                    if activeTF != .cardHolderName{
                        Button("Next"){
                            switch activeTF{
                            case .cardNumber:
                                activeTF = .expirationDate
                            case .cardHolderName: break
                            case .expirationDate:
                                activeTF = .cvv
                            case .cvv:
                                activeTF = .cardHolderName
                            case .none:break
                            }
                        }
                        .tint(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
        }
    }
    /// Card View
    @ViewBuilder
    func CardView() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(.linearGradient(colors: [Color(.blue), Color(.green)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            // Card Details
            VStack(spacing:10){
                HStack{
                    TextField("XXXX XXXX XXXX XXXX",text: .init(get:{
                        cardNumber
                    }, set:{
                        value in cardNumber = value
                        
                        // Inserting Space For Every 4 Digits
                        
                        let startIndex = value.startIndex
                        for index in 0..<value.count{
                            let stringIndex = value.index(startIndex, offsetBy: index)
                            cardNumber += String(value[startIndex])
                            
                            if(index + 1) % 5 == 0 && value[stringIndex] != " "{
                                cardNumber.insert(" ", at:stringIndex)
                            }
                        }
                        
                        
                        if value.last == " "{
                            cardNumber.removeLast()
                        }
                        
                        cardNumber = String(cardNumber.prefix(19))
                    }))
                        .font(.title3)
                        .keyboardType(.numberPad)
                        .focused($activeTF, equals: .cardNumber)
                    
                    Spacer(minLength: 0)
                    Image("Visa")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:25)
                }
                HStack(spacing:12){
                    TextField("MM/YY",text:  .init(get: {
                        expireDate
                    }, set: { value in
                        expireDate = value
                        
                        if value.count == 3 && !value.contains("/"){
                            let startIndex = value.startIndex
                            let thirdPosition = value.index(startIndex, offsetBy:2)
                            expireDate.insert("/", at:thirdPosition)
                        }
                        
                        if value.last == "/"{
                            expireDate.removeLast()
                        }
                        
                        expireDate = String(expireDate.prefix(5))
                    }))
                        .keyboardType(.numberPad)
                        .focused($activeTF, equals: .expirationDate)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    TextField("CVV", text: .init(get: {
                        cvvCode
                    }, set: { value in
                        cvvCode = value
                        
                        cvvCode = String(cvvCode.prefix(3))
                    }))
                        .frame(width: 35)
                        .focused($activeTF, equals: .cvv)
                        .keyboardType(.numberPad)
                    
                    Image(systemName: "questionmark.circle.fill")
                    
                }
                .padding(.top,15)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                TextField("CARD HOLDER NAME",text: $cardHolderName)
                    .focused($activeTF, equals: .cardHolderName)
                    .submitLabel(.done)
            }
            .padding(20)
            .environment(\.colorScheme,.dark)
            .tint(.white)
        }
        .frame(height:200)
        .padding(.top,35)
        
    }
}

#Preview {
    CardHome()
}

// Disable with opacity extension

extension View{
    @ViewBuilder
    func disableWithOpacity(_ status: Bool) -> some View{
        self
            .disabled(status)
            .opacity(status ? 0.6:1)
    }
}
