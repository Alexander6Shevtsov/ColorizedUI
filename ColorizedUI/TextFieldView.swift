//
//  TextFieldView.swift
//  ColorizedUI
//
//  Created by Alexander Shevtsov on 19.03.2025.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    
    let action: () -> Void // действие по завершению работы с текстовым полем
    
    var body: some View {
        TextField("0", text: $text) { _ in // плейсхолдер, передаем текст
            withAnimation { // любое действие с анимацией
                action() // перемещение слайдера с анимацией
            }
        }
        .frame(width: 55, alignment: .trailing) // размер, выравнивание справа
        .multilineTextAlignment(.trailing) // выравнивание текста справа
        .textFieldStyle(.roundedBorder) // стиль текста
        .keyboardType(.numberPad) // цифровой вид клавиатуры без . и ,
    }
}

#Preview {
    ZStack {
        Color.background
        TextFieldView(text: .constant("128"), action: {})
    }
}
