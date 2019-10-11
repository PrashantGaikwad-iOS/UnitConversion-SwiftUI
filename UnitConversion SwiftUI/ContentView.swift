//
//  ContentView.swift
//  UnitConversion SwiftUI
//
//  Created by Saif on 11/10/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // let heightFeet = Measurement(value: 6, unit: UnitLength.feet)
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["meters", "kilometers", "feet", "miles"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["meters", "kilometers", "feet", "miles"]
    
    var inputUnitAfterConversionToOutput: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case "meters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case "kilometers":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case "feet":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case "miles":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch inputUnits[outputUnitValue] {
        case "meters":
            output = String(describing:input.converted(to: UnitLength.meters))
        case "kilometers":
            output = String(describing:input.converted(to: UnitLength.kilometers))
        case "feet":
            output = String(describing:input.converted(to: UnitLength.feet))
        case "miles":
            output = String(describing:input.converted(to: UnitLength.miles))
        default:
            output = String(describing:input.converted(to: UnitLength.meters))
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Enter Input Value here")) {
                    TextField("Input Value", text: $inputValue)
                }
                
                Section(header:Text("Input Unit - ")) {
                    Picker("Input Unit - ",selection: $inputUnitValue) {
                        ForEach(0..<inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Output Unit -")) {
                    Picker("Output Unit - ",selection: $outputUnitValue) {
                        ForEach(0..<outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Check Output Value here")) {
                    Text(inputUnitAfterConversionToOutput)
                }
            }
            .navigationBarTitle(Text("Unit Conversions"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
