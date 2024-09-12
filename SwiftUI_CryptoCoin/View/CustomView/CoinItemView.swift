//
//  CoinItemView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/10/24.
//

import SwiftUI

struct CoinItemView: View {
    var coinItem: CoinItemResponse
    var index: Int
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.title3)
                .bold()
                .padding(.trailing)
            
            AsyncImage(url: URL(string: coinItem.small)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } placeholder: {
                Image(systemName: "star.fill")
            }
            .padding(.trailing, 8)
            CurrencyNameView(
                currencyName: coinItem.name,
                symbol: coinItem.symbol
            )
            Spacer()
            CurrencyIncrementView(
                price: coinItem.data.total_volume,
                increment: coinItem.data.coinFluctuation
            )
        }
        .padding()
    }
}


#Preview {
    CoinItemView(coinItem: .init(id: "", name: "Solana", symbol: "CAT", small: "https://coin-images.coingecko.com/coins/images/39765/small/Simon's_Cat_Logo.png?1724017505", data: .init(price: 0.000027471129439078, price_change_percentage_24h: ["krw": -9.10821379246904], total_volume: "$63,950,922"), market_cap_rank: 256), index: 0)
}
