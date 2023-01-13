//
//  CurrencyShower.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct CurrencyShower: View {
    let currency: String
    var body: some View {
        Text(currency)
            .padding(25)
            .font(.system(size: 25, weight: .semibold))
    }
}

struct CurrencyShower_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyShower(currency: "HRK")
    }
}
