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
    
    @FocusState private var focusedField: Field? // поле фокусирования
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $green, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar { // add кнопки перемещения по бару
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) { // предыдущее текстовое поле
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) { // следующее поле
                            Image(systemName: "chevron.down")
                        }
                        Spacer() // сдвигаем кнопку
                        Button("Done") {
                            focusedField = nil // присваиваем значение
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.background)
            .onTapGesture { // тап по экрану
                focusedField = nil // меняет состояние клавиатуры
            }
        }
    }
}

extension ContentView {
    private enum Field { // переключение между текстовыми полями
        case red
        case green
        case blue
    }
    
    private func nextField() { // переключение на следуюшие поля вниз
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() { // переключение на следующие поля вверх
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

#Preview {
    ContentView()
}
