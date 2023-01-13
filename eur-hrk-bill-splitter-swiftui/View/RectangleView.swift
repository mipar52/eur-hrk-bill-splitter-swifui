//
//  RectangleView.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct RectangleView: View {
    @State var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(color)
            .frame(width: UIScreen.main.bounds.width - 20, height: 80)
            .opacity(0.5)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(color: Color(.systemIndigo))
    }
}
