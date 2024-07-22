//
//  CardValidation.swift
//  CreditCard
//
//  Created by Admin on 22/07/24.
//

import Foundation

protocol CardValidation {
    var maxCardLength: Int { get }
    var cardType : cardStartingNumber  { get }
    func isValidCardNumber(_ number: String) -> Bool
    func maskCardNumber(_ number: String) -> String
}

enum cardStartingNumber: String {
    case visa = "4"
    case masterCard = "5"
    case american = "3"
}

struct VisaCardValidation: CardValidation {
    var maxCardLength: Int = 16
    
    var cardType : cardStartingNumber = .visa
    
    func isValidCardNumber(_ number: String) -> Bool {
        return number.count == maxCardLength && number.first == "4"
    }
    
    func maskCardNumber(_ number: String) -> String {
        return "XXXX-XXXX-XXXX-\(number.suffix(4))"
    }
    
}

struct MasterCardValidation: CardValidation {
    var maxCardLength: Int = 16
    
    var cardType : cardStartingNumber = .masterCard
    func isValidCardNumber(_ number: String) -> Bool {
        return number.count == maxCardLength && number.first == "5"
    }

    func maskCardNumber(_ number: String) -> String {
        return "XXXX-XXXX-XXXX-\(number.suffix(4))"
    }
}

struct AmericanExpressCardValidation: CardValidation {
    var maxCardLength: Int = 15
    
    var cardType : cardStartingNumber = .american
    func isValidCardNumber(_ number: String) -> Bool {
        return number.count == maxCardLength && number.first == "3"
    }

    func maskCardNumber(_ number: String) -> String {
        return "XXXX-XXXX-XXX\(number.prefix(1))-\(number.suffix(3))"
    }
}
