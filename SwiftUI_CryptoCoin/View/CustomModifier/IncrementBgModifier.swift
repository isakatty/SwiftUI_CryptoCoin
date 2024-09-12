//
//  IncrementBgModifier.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

private struct IncrementBgModifier: ViewModifier {
    let increment: Double
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(increment > 0 ? .red.opacity(0.3) : .blue.opacity(0.3))
            content
                .font(.footnote)
                .bold()
                .foregroundStyle(increment > 0 ? .red : .blue)
        }
        .frame(width: 70, height: 25, alignment: .center)
    }
}

extension View {
    func incrementBGModifier(increment: Double) -> some View {
        modifier(IncrementBgModifier(increment: increment))
    }
}
