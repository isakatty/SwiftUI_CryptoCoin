//
//  MyPageView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationWrapper {
            Text("하이루")
                .navigationTitle("MyPage")
        }
    }
}

#Preview {
    MyPageView()
}
