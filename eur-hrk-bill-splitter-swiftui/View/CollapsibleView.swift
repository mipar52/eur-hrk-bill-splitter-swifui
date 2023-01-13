//
//  CollapsibleView.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct CollapsibleView: View {
    @State var label: () -> TitleView
//    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var placeholderOne : String
    @Binding var labelOne : String
    
    var placeholderTwo: String
    @Binding var labelTwo : String
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
               // GroupBox {
                    ZStack {
                        RectangleView(color: .indigo)
                        HStack {
                            AmountTextField(placeholder: placeholderOne, text: $labelOne)
                            CurrencyShower(currency: "€")
                        }
                    }
               // }
                
              //  GroupBox {
                    ZStack {
                        RectangleView(color: .indigo)
                        HStack {
                            AmountTextField(placeholder: placeholderTwo, text: $labelTwo)
                            CurrencyShower(currency: "HRK")
                        }
                    }
                //}
            }

            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
    }
}

//struct CollapsibleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollapsibleView()
//    }
//}
