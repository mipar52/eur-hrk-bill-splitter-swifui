//
//  MainScreen.swift
//  eur-hrk-bill-splitter-swiftui
//
//  Created by Milan Parađina on 11.01.2023..
//

import SwiftUI

struct MainScreen: View {
    
    @State private var euroAmount: String = ""
    @State private var hrkAmount: String = ""
    
    @State private var amountPersonEuro: String = ""
    @State private var amountPersonHrk: String = ""
    
    @State private var euroTip: String = ""
    @State private var hrkTip: String = ""
    
    @State private var tipSelected: Double = 0.1
    @State private var peopleCount: Int = 1
    
    @State private var tipPersonEuro: String = ""
    @State private var tipPersonHrk: String = ""
    
    @State private var customTip: String = ""
    @State private var customPeopleNum: String = ""
    
    @State private var isUserEditingEuro: Bool = false
    @State private var isUserEditingHrk: Bool = false
    
    @State private var showingTipAlert: Bool = false
    @State private var showingPeopleAlert: Bool = false
    
    
    let converter = Converter()
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea(.all)
        ScrollView (.vertical){
            VStack {
//MARK: Amount modifiers
                VStack() {
                    Text("HRK/EUR bill splitter")
                        .font(.system(size: 30, weight: .bold))
                        .padding(20)
                    
                    VStack (spacing: 20){
                        TitleView(titleString: "Amount")
                        
                        ZStack {
                            RectangleView(color: .indigo)
                            HStack {
                                TextField("EUR amount", text: $euroAmount) { hasStarted in
                                    if hasStarted {
                                        isUserEditingEuro = true
                                    } else {
                                        isUserEditingEuro = false
                                    }
                                }
                                    .onChange(of: euroAmount, perform: { newValue in
                                        if !isUserEditingHrk {
                                            let decimalNewValue = newValue.replacingOccurrences(of: ",", with: ".")
                                            hrkAmount = self.converter.getConversionResult(currency: "EUR", amount: decimalNewValue)
                                                
                                            amountPersonEuro = self.converter.getAmountByPerson(amount: decimalNewValue, numOfPeeps: peopleCount)
                                            amountPersonHrk = self.converter.getAmountByPerson(amount: hrkAmount, numOfPeeps: peopleCount)
                                            
                                            euroTip = self.converter.calculateTip(amount: decimalNewValue, tip: tipSelected)
                                            hrkTip = self.converter.calculateTip(amount: hrkAmount, tip: tipSelected)
                                            
                                            tipPersonEuro = self.converter.getTipByPerson(tip: euroTip, numOfPeeps: peopleCount)
                                            tipPersonHrk = self.converter.getTipByPerson(tip: hrkTip, numOfPeeps: peopleCount)
                                        }
                                    })
                                
                                .padding(20)
                                .font(.system(size: 20, weight: .semibold))
                                .keyboardType(.decimalPad)
                                
                                CurrencyShower(currency: "€")
                            }
                        }
                        ZStack {
                            RectangleView(color: .indigo)
                            HStack {
                                TextField("HRK amount", text: $hrkAmount) { hasStarted in
                                    if hasStarted {
                                        isUserEditingHrk = true
                                    } else {
                                        isUserEditingHrk = false
                                    }
                                }
                                    .onChange(of: hrkAmount, perform: { newValue in
                                        if !isUserEditingEuro {
                                            let decimalNewValue = newValue.replacingOccurrences(of: ",", with: ".")
                                            euroAmount = self.converter.getConversionResult(currency: "HRK", amount: decimalNewValue)

                                            amountPersonEuro = self.converter.getAmountByPerson(amount: euroAmount, numOfPeeps: peopleCount)

                                            amountPersonHrk = self.converter.getAmountByPerson(amount: decimalNewValue, numOfPeeps: peopleCount)

                                            euroTip = self.converter.calculateTip(amount: euroAmount, tip: tipSelected)

                                            hrkTip = self.converter.calculateTip(amount: decimalNewValue, tip: tipSelected)

                                            tipPersonEuro = self.converter.getTipByPerson(tip: euroTip, numOfPeeps: peopleCount)
                                            tipPersonHrk = self.converter.getTipByPerson(tip: hrkTip, numOfPeeps: peopleCount)
                                        }
                                    })
                                .padding(20)
                                .font(.system(size: 20, weight: .semibold))
                                .keyboardType(.decimalPad)
                                CurrencyShower(currency: "HRK")
                            }
                        }
                    }
                    //MARK: Tip & people count modifiers

                    HStack {
        
                        Menu("Person Count: \(peopleCount)") {
                            Button {
                                peopleCount = 1
                                
                            } label: {
                                Text("1")
                            }
                            Button {
                                peopleCount = 2
                            } label: {
                                Text("2")
                            }
                            Button {
                                peopleCount = 3
                            } label: {
                                Text("3")
                            }
                            Button {
                                peopleCount = 4
                            } label: {
                                Text("4")
                            }
                            Button {
                                showingPeopleAlert = true
                            } label: {
                                Text("Custom")
                            }
                        }
                        .onChange(of: peopleCount, perform: { newValue in
                            
                            amountPersonEuro = self.converter.getAmountByPerson(amount: euroAmount, numOfPeeps: newValue)
                            amountPersonHrk = self.converter.getAmountByPerson(amount: hrkAmount, numOfPeeps: newValue)
                            
                            tipPersonEuro = self.converter.getTipByPerson(tip: euroTip, numOfPeeps: newValue)
                            tipPersonHrk = self.converter.getTipByPerson(tip: hrkTip, numOfPeeps: newValue)
                        })
                        
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.cyan)
                        .padding(15)
                        
                        Menu("Tip: \(String(format: "%.2f", tipSelected*100))%") {
                            Button("10%") {
                                tipSelected = 0.1
                            }
                            Button("20%") {
                                tipSelected = 0.2
                            }
                            Button ("Custom") {
                                showingTipAlert.toggle()
                            }
                            
                            .onChange(of: tipSelected) { newValue in
                                euroTip = self.converter.calculateTip(amount: euroAmount, tip: newValue)
                                hrkTip = self.converter.calculateTip(amount: hrkAmount, tip: newValue)
                        
                                tipPersonEuro = self.converter.getTipByPerson(tip: euroTip, numOfPeeps: peopleCount)
                                tipPersonHrk = self.converter.getTipByPerson(tip: hrkTip, numOfPeeps: peopleCount)
                            }

                        }
                        .alert("Custom tip", isPresented: $showingPeopleAlert) {
                             TextField("Add amount", text: $customTip)
                                .keyboardType(.numberPad)
                            Button("Add") {
                                 tipSelected = (Double(customTip) ?? 0.0) / 100
                             }
                            
                            Button("Cancel", role: .cancel) {}
                         } message: {
                             Text("Enter you custom tip")
                         }
                         .alert("Custom person amount", isPresented: $showingPeopleAlert) {
                              TextField("Add amount", text: $customPeopleNum)
                                 .keyboardType(.numberPad)
                             Button("Add") {
                                  peopleCount = Int(customPeopleNum) ?? 1
                              }
                             
                             Button("Cancel", role: .cancel) {}
                          } message: {
                              Text("Enter you custom person amount")
                          }
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.cyan)
                        .padding(15)
                    }
                    
                    VStack() {
//MARK: Collapisble views
                        CollapsibleView(label: {
                            TitleView(titleString: "Amount by person")

                        }, placeholderOne: "Amount in Euro", labelOne: $amountPersonEuro, placeholderTwo: "Amount in HRK", labelTwo: $amountPersonHrk)
                        
                        CollapsibleView(label: {
                            TitleView(titleString: "Tip")
                        }, placeholderOne: "Tip in Euro", labelOne: $euroTip, placeholderTwo: "Tip in HRK", labelTwo: $hrkTip)
                    }

                    CollapsibleView(label: {
                        TitleView(titleString: "Tip by person")

                    }, placeholderOne: "Tip in Euro", labelOne: $tipPersonEuro, placeholderTwo: "Tip in HRK", labelTwo: $tipPersonHrk)

                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
