//
//  CurrencyBGView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct CurrencyBGView: View {
    let price: String
    let increment: Double
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(price)
                .font(.headline)
                .bold()
                .fontWeight(.medium)
            Text(increment > 0 ? "+\(increment.formattedTwoDecimal)%" : "-\(increment.formattedTwoDecimal)%")
                .incrementBGModifier(increment: increment)
                .padding(.bottom)
        }
    }
}
