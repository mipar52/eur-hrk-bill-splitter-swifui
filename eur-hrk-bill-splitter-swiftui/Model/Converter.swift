//
//  Converter.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 10.01.2023..
//

import Foundation

struct Converter {
    
    func getConversionResult(currency: String, amount: String) -> String {
       let amountDouble = Double(amount)
       if let amountDouble = amountDouble {
           if currency == "HRK" {
               return getFourDecimalNum(amountDouble / 7.5345)
           } else {
               return getFourDecimalNum(amountDouble * 7.5345)
           }
       } else {
           return ""
       }
   }
    
    func calculateTip(amount: String, tip: Double) -> String {
        
        let amountDouble = Double(amount)
        if let amountDouble = amountDouble {
            return getFourDecimalNum(amountDouble * tip)
        } else {
            return ""
        }
    }
    
    func getAmountByPerson(amount: String, numOfPeeps: Int) -> String {
        let doubleAmount = Double(amount)
        
        if let doubleAmount = doubleAmount {
            return getFourDecimalNum(doubleAmount/Double(numOfPeeps))
        } else {
            return ""
        }
        
    }
    
    func getTipByPerson(tip: String, numOfPeeps: Int) -> String {
        let tipDouble = Double(tip)
        if let tipDouble = tipDouble {
            return getFourDecimalNum(tipDouble/Double(numOfPeeps))
        } else {
            return ""
        }
    }
    
    func getFourDecimalNum(_ arguments: CVarArg) -> String{
        return String(format: "%.4f", arguments)
    }
}
