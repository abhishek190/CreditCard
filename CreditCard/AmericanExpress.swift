//
//  AmericanExpress.swift
//  CreditCard
//
//  Created by Admin on 21/07/24.
//

import Foundation
import SwiftUI

struct AmericanExpress: View {
    var selectedCardValidator: CardValidation?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 50,height: 30)
                .border(selectedCardValidator?.cardType == .american ? Color.black : Color.gray,width: 3)
                .cornerRadius(6.0)
            Text("AM EX")
                .foregroundStyle(selectedCardValidator?.cardType == .american ? Color.black : Color.gray)
                .font(.system(size: 10))
                .fontWeight(.bold)
        }
        .frame(width: 50,height: 30)
    }
}

#Preview {
    AmericanExpress(selectedCardValidator: AmericanExpressCardValidation())
}
