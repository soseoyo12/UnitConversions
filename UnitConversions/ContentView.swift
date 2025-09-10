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
    
    @State var inputValue = 20
    @State var outputValue = 100
    
    
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
                    TextField("Input", value: $inputValue, format: .currency(code: "USD"))
                }
                
                
                
                
            }
            .navigationTitle("UnitConversions")
        }
        
        
    }
}

#Preview {
    ContentView()
}
