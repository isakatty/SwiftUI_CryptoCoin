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
                .font(.footnote)
                .foregroundStyle(increment > 0 ? .red : .blue)
                .background(increment > 0 ? .red.opacity(0.2) : .blue.opacity(0.2))
        }
    }
}
