//
//  AmountTextField.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct AmountTextField: View {
    
    @State var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
        .padding(20)
        .font(.system(size: 20, weight: .semibold))
        .disabled(true)
    }
}

//struct AmountTextField_Previews: PreviewProvider {
//    @State var someTestText : String = ""
//
//    static var previews: some View {
//        AmountTextField(placeholder: "Just testing", text: someTestText)
//    }
//}
