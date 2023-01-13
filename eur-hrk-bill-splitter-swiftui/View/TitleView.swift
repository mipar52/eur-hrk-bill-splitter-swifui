//
//  TitleView.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct TitleView: View {
    let titleString: String
    var body: some View {
        
        Text(titleString)
            .font(.system(size: 25, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(titleString: "Just testing")
    }
}
