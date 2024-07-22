//
//  VisaImage.swift
//  CreditCard
//
//  Created by Admin on 21/07/24.
//

import Foundation
import SwiftUI

struct VisaImage: View {
    var selectedCardValidator: CardValidation?
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 50,height: 30)
                .border(selectedCardValidator?.cardType == .visa ? Color.black : Color.gray,width: 3)
                .cornerRadius(6.0)
            Text("VISA")
                .foregroundStyle(selectedCardValidator?.cardType == .visa ? Color.black : Color.gray)
                .bold()
        }
        .frame(width: 50,height: 30)
    }
}

#Preview {
    VisaImage(selectedCardValidator: VisaCardValidation())
}
