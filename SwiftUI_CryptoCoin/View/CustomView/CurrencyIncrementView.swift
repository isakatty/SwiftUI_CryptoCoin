//
//  CurrencyIncrementView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/10/24.
//

import SwiftUI

struct CurrencyIncrementView: View {
    let price: String
    let increment: Double
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(price)
                .font(.headline)
                .fontWeight(.medium)
            Text("\(increment.formattedTwoDecimal)%")
                .font(.footnote)
                .foregroundStyle(increment > 0 ? .red : .blue)
        }
    }
}

//#Preview {
//    CurrencyIncrementView()
//}
