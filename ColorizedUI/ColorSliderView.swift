//
//  ColorSliderView.swift
//  ColorizedUI
//
//  Created by Alexander Shevtsov on 19.03.2025.
//

import SwiftUI

struct ColorSliderView: View { // разгружаем ContentView
    
    @Binding var value: Double // бегунок
    @State private var text = ""
    @State private var showAlert = false
    
    let color: Color // цвет слайдера
    
    var body: some View {
        HStack {
            Text(value.formatted()) // приводим к строке
                .frame(width: 35, alignment: .leading) // размер текста слева
                .foregroundStyle(.white)
            
            Slider(value: $value, in: 0...255, step: 1) // значение,диапозон,шаг
                .tint(color)
                .onChange(of: value) { _, newValue in // отслеживание бегунка
                    text = newValue.formatted() // приводим к строке
                }
            
            TextFieldView(text: $text, action: checkValue)
                .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
        }
        .onAppear { // передаем значение из слайдера в текст справа
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Double(text), (0...255).contains(value) {
            self.value = value
        } else {
            showAlert.toggle()
            value = 0
            text = "0"
        }
    }
}

#Preview {
    ZStack {
        Color.background
        ColorSliderView(value: .constant(100), color: .red)
    }
}
