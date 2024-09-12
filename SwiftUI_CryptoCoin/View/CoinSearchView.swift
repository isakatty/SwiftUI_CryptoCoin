//
//  CoinSearchView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct CoinSearchView: View {
    @State private var searchTxt: String = ""
    
    var body: some View {
        NavigationWrapper {
            Text("CoinSearchView")
                .searchable(text: $searchTxt)
                .navigationTitle("Search")
        }
    }
}

#Preview {
    CoinSearchView()
}
