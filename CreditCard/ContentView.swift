//
//  ContentView.swift
//  CreditCard
//
//  Created by Admin on 21/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var enteredPreviousText: String = ""
    @State var isDisabledRegisterAndTextField: Bool = false
    @State var selectedCardValidator: CardValidation?
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Register Card")
                .font(.title)
                .bold()
                .padding(.bottom,50)
            
            HStack {
                VisaImage(selectedCardValidator: viewModel.selectedCardValidator)
                MasterCard(selectedCardValidator: viewModel.selectedCardValidator)
                AmericanExpress(selectedCardValidator: viewModel.selectedCardValidator)
            }
            .padding(.bottom,20)
            HStack {
                TextField("Enter a number", text: $inputText)
                    .keyboardType(.numberPad)
                    .onChange(of: inputText) { oldValue, newValue in
                        print(oldValue)
                        if !self.isDisabledRegisterAndTextField {
                            viewModel.validateInput(inputText)
                        }
                    }
                    
                    .disabled(isDisabledRegisterAndTextField)
                Button(action: {
                    print("Cross Button Clicked")
                    self.inputText = ""
                    viewModel.reset()
                    self.isDisabledRegisterAndTextField = false
                }, label: {
                    Text("X")
                        .foregroundStyle(Color.black)
                })
                .frame(width: 10,height: 10)
                .zIndex(1)
            }
            .overlay {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor( viewModel.isEnteredTextIsBelowLength ? Color.gray : ( viewModel.isEnteredTextValid ? Color.green : Color.red ))
                    .offset(y : 15)
            }
            HStack {
                Text(viewModel.enteredTextMessage)
                    .foregroundStyle(viewModel.isEnteredTextValid ? Color.green : Color.red )
                    .padding(.top, 5)
                Spacer()
                Text("\(isDisabledRegisterAndTextField ? self.enteredPreviousText.count :  self.inputText.count)")
                    .foregroundStyle(Color.gray)
            }
            Spacer()
            Button(action: {
                if viewModel.isEnteredTextValid {
                    self.enteredPreviousText = inputText
                    self.inputText = viewModel.selectedCardValidator?.maskCardNumber(inputText) ?? ""
                    self.isDisabledRegisterAndTextField = true
                }
            }, label: {
                Text("Register")
                    .foregroundStyle(Color.white)
                    .bold()
                    .frame(width: 350,height: 45)
                    .background(Color.red)
                    .cornerRadius(5)
                    .opacity(viewModel.isEnteredTextValid ? 1.0 : 0.5)
            })
            .disabled(isDisabledRegisterAndTextField)
            .opacity(isDisabledRegisterAndTextField ? 0.5 : 1.0)
            
        }
        .frame(width: 350,alignment: .leading)
        .padding()
    }
}

#Preview {
    ContentView()
}
