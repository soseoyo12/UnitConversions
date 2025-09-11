//
//  ContentView.swift
//  UnitConversions
//
//  Created by SeongYongSong on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var celsius = 20
    @State private var fahrenheit = 70
    @State private var kelvin = 19
    
    let unitArr = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State var selectedUnitFrom = "Celsius"
    @State var selectedUnitTo = "Fahrenheit"
    
    @State var inputValue = ""
    var outputValue: Double? {
        guard let inputValue = Double(inputValue) else { return nil }
        var ReferenceValue = 0.0
        
        
        if selectedUnitFrom == "Celsius" {
            ReferenceValue = Double(inputValue)
        } else if selectedUnitFrom == "Fahrenheit" {
            ReferenceValue = (Double(inputValue) - 32) / 1.8
        } else {
            ReferenceValue = Double(inputValue) - 273.15
        }
        
        if selectedUnitTo == "Celsius" {
            return ReferenceValue
        } else if selectedUnitTo == "Fahrenheit" {
            return (ReferenceValue * 1.8) + 32
        } else {
            return ReferenceValue + 273.15
        }
        
    }
    
    
    
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section("From"){
                    Picker("from", selection: $selectedUnitFrom) {
                        ForEach(unitArr, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To"){
                    Picker("to", selection: $selectedUnitTo) {
                        ForEach(unitArr, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section {
                    TextField("Input", text: $inputValue)
                }
                
                Section {
                    if let result = outputValue {
                        Text("\(result)")
                    } else {
                        Text("Output")
                    }
                }
                
                
                
            }
            .navigationTitle("UnitConversions")
        }
        
        
    }
}

#Preview {
    ContentView()
}
