//
//  CurrencyNameView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/10/24.
//

import SwiftUI

struct CurrencyNameView: View {
    let currencyName: String
    let symbol: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currencyName)
                .font(.headline)
                .bold()
            Text(symbol)
                .font(.footnote)
        }
    }
}
//
//#Preview {
//    CurrencyNameView()
//}
