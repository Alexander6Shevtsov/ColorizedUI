//
//  ContentView.swift
//  ColorizedUI
//
//  Created by Alexander Shevtsov on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputAction: Bool
    
    var body: some View {
        // ZStack для модификатора .onTapGesture
        // Без использования ZStack область жестов
        // Ограничивается вертикальным стеком, который
        // Заканчивается сразу после слайдеров
        ZStack {
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputAction)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputAction = false
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.background)
        .onTapGesture {
            isInputAction = true
        }
    }
}

#Preview {
    ContentView()
}
