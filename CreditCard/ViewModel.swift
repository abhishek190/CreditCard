//
//  ViewModel.swift
//  CreditCard
//
//  Created by Admin on 22/07/24.
//

import Foundation
class ViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var enteredTextMessage: String = ""
    @Published var isEnteredTextValid: Bool = false
    @Published var maskedAccountNumber: String = ""
    @Published var isEnteredTextIsBelowLength: Bool = true
    
    private var cardValidators: [CardValidation] = [VisaCardValidation() , MasterCardValidation(), AmericanExpressCardValidation()]
    @Published var selectedCardValidator: CardValidation?
    
    func validateInput(_ inputNumber: String) {
        guard !inputNumber.isEmpty else {
            selectedCardValidator = nil
            return
        }
        
        if let firstDigit = inputNumber.first {
            let firstDigitString = String(firstDigit)
            selectedCardValidator = cardValidators.first { $0.cardType.rawValue == firstDigitString }
        } else {
            selectedCardValidator = nil
        }
        
        if let validator = selectedCardValidator, validator.isValidCardNumber(inputNumber) {
            isEnteredTextValid = true
            enteredTextMessage = "Looks Good!"
            isEnteredTextIsBelowLength = false
        } else {
            isEnteredTextValid = false
            enteredTextMessage = inputNumber.count > selectedCardValidator?.maxCardLength ?? 0 ? "Too Long" : ""
            isEnteredTextIsBelowLength = inputNumber.count < selectedCardValidator?.maxCardLength ?? 0
        }
    }
    
    func reset() {
        isEnteredTextIsBelowLength = true
        inputText = ""
        isEnteredTextValid = false
        enteredTextMessage = ""
        maskedAccountNumber = ""
    }
}
