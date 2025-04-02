//
//  ContentView.swift
//  ColorizedUI
//
//  Created by Alexander Shevtsov on 19.03.2025.
//

import SwiftUI

struct ContentView: View { // текущее рандомное значение слайдеров
    @State private var red = Double.random(in: 0...255).rounded() // округление
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputAction: Bool // состояние клавиатуры
    
    var body: some View {
        
        // ZStack для модификатора .onTapGesture
        // без использования ZStack область жестов
        // ограничивается вертикальным стеком, который
        // заканчивается сразу после слайдеров
        
        ZStack { // фиксация тапа по экрану для скрытия клавиатуры
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputAction) // вызов клавиатуры
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer() // сдвигаем кнопку
                        Button("Done") {
                            isInputAction = false // присваиваем значение
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.background)
        .onTapGesture { // тап по экрану
            isInputAction = false // меняет состояние клавиатуры
        }
    }
}

#Preview {
    ContentView()
}
