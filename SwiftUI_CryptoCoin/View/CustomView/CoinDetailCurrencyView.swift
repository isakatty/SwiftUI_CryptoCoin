//
//  CoinDetailCurrencyView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/14/24.
//

import SwiftUI

struct CoinDetailCurrencyView: View {
    let price: Int
    let increment: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("₩\(price.formatted(.number))")
                .bold()
                .font(.largeTitle)
            HStack {
                Text(increment > 0 ? "+\(increment.formattedTwoDecimal)%" : "\(increment.formattedTwoDecimal)%")
                    .foregroundStyle(increment > 0 ? Color.red : Color.blue)
                Text("Today")
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
    }
}

#Preview {
    CoinDetailCurrencyView(price: 69123231, increment: 3.22)
}
