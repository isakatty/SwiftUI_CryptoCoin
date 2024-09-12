//
//  FavedCoinView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct FavedCoinCardView: View {
    var coinDetail: CoinMarketResponseDTO
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .shadow(radius: 1)
                .frame(height: 150)
                .padding()
            Group {
                VStack(alignment: .trailing) {
                    VStack(alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: coinDetail.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .scaledToFill()
                            } placeholder: {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                                    .padding(.trailing, 10)
                            }
                            CurrencyNameView(currencyName: coinDetail.name, symbol: coinDetail.symbol)
                            Spacer()
                        }
                        .padding()
                    }
                    CurrencyBGView(price: coinDetail.current_price, increment: coinDetail.price_change_percentage_24h)
                        .padding(.trailing)
                }
            }
            .padding()
        }
        .frame(alignment: .leading)
    }
}

#Preview {
    FavedCoinCardView(
        coinDetail: CoinMarketResponseDTO.init(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            current_price: 77421322,
            price_change_percentage_24h: 3.73969,
            low_24h: 74630375,
            high_24h: 78364591,
            ath: 98576718,
            ath_date: "2024-06-07T13:55:20.414Z",
            last_updated: "2024-09-12T14:55:01.773Z",
            sparkline_in_7d: .init(price: [])
        )
    )
}
