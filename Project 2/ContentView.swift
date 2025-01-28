//
//  ContentView.swift
//  Project 2
//
//  Created by Aisosa Obasohan on 17/01/2025.
//

import SwiftUI

struct UnitConverter: View {
    @State var input = 0.0
    @State var baseUnit = "Meters"
    @State var targetUnit = "Meters"
    @FocusState var isFocused: Bool
    
    let units = ["Meters", "Kilometers", "Feets", "Yards", "Miles"]
    
    var conversion: Double {
        
        let milimeters : Double
        
        //Converts the input unit to milimeters
        switch baseUnit {
        case "Meters":
            milimeters = input * 1_000
        case "Kilometers":
            milimeters = input * 1_000_000
        case "Feets":
            milimeters = input * 304.8
        case "Yards":
            milimeters = input * 914.4
        case "Miles":
            milimeters = input * 1_609_344
        default:
            return 0.0
        }
        
        //Converts milimeters to the preffered output
        switch targetUnit {
        case "Meters":
            return milimeters / 1_000
        case "Kilometers":
            return milimeters / 1_000_000
        case "Feets":
            return milimeters / 304.8
        case "Yards":
            return milimeters / 914.4
        case "Miles":
            return milimeters / 1_609_344
        default:
            return 0.0
        }
        
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    
                    TextField("Enter a figure", value:$input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Select unit", selection:$baseUnit) {
                        ForEach(units, id:\.self) { item in
                            Text(item) }
                    }
                }
                
                
                Section("Output") {
                    Picker("Select unit", selection:$targetUnit) {
                        ForEach(units, id:\.self) { item in
                            Text(item) }
                    }
                }
                
                
                Section("Your Results!") {
                    Text(conversion, format: .number)
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    UnitConverter()
}
