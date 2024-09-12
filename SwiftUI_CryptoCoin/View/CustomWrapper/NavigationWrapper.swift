//
//  NavigationWrapper.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/8/24.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
}
