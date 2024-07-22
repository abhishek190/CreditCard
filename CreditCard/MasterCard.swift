//
//  MasterCard.swift
//  CreditCard
//
//  Created by Admin on 21/07/24.
//

import Foundation
import SwiftUI

struct MasterCard: View {
    var selectedCardValidator: CardValidation?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .border(selectedCardValidator?.cardType == .masterCard ? Color.black : Color.gray,width: 3)
                .frame(width: 50,height: 30)
                .cornerRadius(6.0)
            HStack(spacing: -10){
                Circle()
                    .fill(selectedCardValidator?.cardType == .masterCard  ? Color.black : Color.gray)
                    .stroke(selectedCardValidator?.cardType == .masterCard  ? Color.black : Color.gray)
                    .frame(width: 20)
                    .zIndex(1)
                Circle()
                    .stroke(selectedCardValidator?.cardType == .masterCard  ? Color.black : Color.gray)
                    .frame(width: 20)
                    
                    
            }
        }.frame(width: 50,height: 30)
    }
}

#Preview {
    MasterCard(selectedCardValidator: MasterCardValidation())
}
