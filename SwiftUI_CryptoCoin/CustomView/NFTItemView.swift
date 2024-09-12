//
//  NFTItemView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct NFTItemView: View {
    var nftItem: NFTResponse
    var index: Int
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.title3)
                .bold()
                .padding(.trailing)
            
            AsyncImage(url: URL(string: nftItem.thumb)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } placeholder: {
                Image(systemName: "star.fill")
            }
            .padding(.trailing, 8)
            CurrencyNameView(
                currencyName: nftItem.name,
                symbol: nftItem.symbol
            )
            Spacer()
            CurrencyIncrementView(
                price: nftItem.data.floor_price,
                increment: Double(nftItem.data.floor_price_in_usd_24h_percentage_change) ?? 0.0
            )
        }
        .padding()
    }
}

