//
//  StockWithTitleView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/14/24.
//

import SwiftUI

struct StockWithTitleView: View {
    let title: String
    let price: Int
    let isHighest: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundStyle(isHighest ? .red : .blue)
            
            Text("₩\(price.formatted(.number))")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StockWithTitleView(title: "고가", price: 123123123, isHighest: true)
}
