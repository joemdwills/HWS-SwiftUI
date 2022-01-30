//
//  ContentView.swift
//  day19
//
//  Created by Joe Williams on 23/01/2022.
//
import SwiftUI


struct ContentView: View {
    // Input Value
    @State private var inputValue: Double = 0.0
    
    // Unit Type Index
    @State private var unitTypeIndex = 0
    
    // Selected input unit index
    @State private var inputNamedUnitIndex = Array(repeating: 0, count: UnitTypes.types.count)
    
    // Selected output unit index
    @State private var outputNamedUnitIndex = Array(repeating: 0, count: UnitTypes.types.count)
    
    // Available unit types (top level selection)
    var unitTypes: [UnitType.Type] {
        return UnitTypes.types
    }
    
    // Available units for selected unit type
    var namedUnits: [NamedUnit] {
        return unitTypes[unitTypeIndex].units
    }
    
    // Selected input unit
    var inputNamedUnit: NamedUnit {
        let selectedInputIndex = inputNamedUnitIndex[unitTypeIndex]
        return namedUnits[selectedInputIndex]
    }
    
    // Selected output unit
    var outputNamedUnit: NamedUnit {
        let selectedOutputIndex = outputNamedUnitIndex[unitTypeIndex]
        return namedUnits[selectedOutputIndex]
    }
    
    // Conversion
    var result: Double {
        let source = Measurement(value: inputValue , unit: inputNamedUnit.unit)
        return source.converted(to: outputNamedUnit.unit).value
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Unit Type", selection: $unitTypeIndex) {
                        ForEach(0..<unitTypes.count, id: \.self) {
                            Text("\(self.unitTypes[$0].name)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Input")) {
                    HStack {
                        TextField("Value", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text(inputNamedUnit.name)
                    }
                    Picker("Input", selection: $inputNamedUnitIndex[unitTypeIndex]) {
                        ForEach(0..<namedUnits.count, id: \.self) {
                            Text(self.namedUnits[$0].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Output")) {
                    HStack {
                        Text(result, format: .number)
                        Spacer()
                        Text(outputNamedUnit.name)
                    }
                    Picker("Output", selection: $outputNamedUnitIndex[unitTypeIndex]) {
                        ForEach(0..<namedUnits.count, id: \.self) {
                            Text(self.namedUnits[$0].unit.symbol)
                        }
                    }
                    .id(unitTypeIndex)
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
