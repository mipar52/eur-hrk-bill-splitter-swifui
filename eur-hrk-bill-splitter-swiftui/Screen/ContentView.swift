//
//  ContentView.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 10.01.2023..
//

import SwiftUI

struct ContentView: View {
    @State var tipSelected: String = "0%"
    var body: some View {
        MainScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
