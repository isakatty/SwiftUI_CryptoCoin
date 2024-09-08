//
//  ContentView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        print("== ContentView init ==")
    }
    
    var body: some View {
        NavigationWrapper {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Text("하이루")
            }
            .padding()
            .navigationTitle("Crypto Coin")
        }
    }
}

#Preview {
    ContentView()
}
