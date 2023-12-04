//
//  ContentView.swift
//  tempConverter
//
//  Created by Adrian Senften on 04.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperatur = 20.0
    @State private var selectedUnit: String = "C"
    
    var kel: Double {
        var tempInKelvin = 1.0
        
        
        if selectedUnit == "F" {
            tempInKelvin = (inputTemperatur - 32) * 5/9 + 273.15
            return tempInKelvin
        } else if selectedUnit == "C"{
            tempInKelvin = inputTemperatur + 273.15
            return tempInKelvin
        }
        else {
            tempInKelvin = inputTemperatur
            return tempInKelvin
        }
    }
    
    var cel: Double {
        var tempInC = 1.0
        if selectedUnit == "F" {
            tempInC = (inputTemperatur - 32) * 5/9
            return tempInC
        } else if selectedUnit == "K"{
            tempInC = inputTemperatur - 273.15
            return tempInC
        }
        else {
            return inputTemperatur
        }
    }
    
    var far: Double {
        var tempInF = 1.0
        if selectedUnit == "C" {
            tempInF = (inputTemperatur * 5/9) + 32
            return tempInF
        } else if selectedUnit == "K"{
            tempInF = (inputTemperatur - 273.15) * 9/5 + 32
            return tempInF
        }
        else {
            return inputTemperatur
        }
    }
    
    
    let tempUnits = ["C", "F", "K"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Enter your temperature and unit") {
                    TextField("Temperautr", value: $inputTemperatur, format: .number)
                    
                    Picker("Temperatur Unit", selection: $selectedUnit
                    ) {
                        ForEach(tempUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    
                    Text("\(cel, specifier: "%.1f") C")
                    Text("\(far, specifier: "%.1f") F")
                    Text("\(kel, specifier: "%.2f") K")
                    
                }
                .padding()
            }
            .navigationTitle("Temperatur Converter")
        }
        
    }
}

#Preview {
    ContentView()
}
