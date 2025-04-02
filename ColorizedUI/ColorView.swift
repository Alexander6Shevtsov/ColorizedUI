//
//  ColorView.swift
//  ColorizedUI
//
//  Created by Alexander Shevtsov on 19.03.2025.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .clipShape(.rect(cornerRadius: 20))
            .frame(height: 130) // высота
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 2) // ореол 
            )
    }
}

#Preview {
    ZStack {
        Color .background
        ColorView(red: 100, green: 100, blue: 100)
    }
}
