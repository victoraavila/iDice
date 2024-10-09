//
//  SettingsView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var numberOfSides = 6
    @State private var numberOfDice = 1
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer() // Align to the left
                    Picker("", selection: $numberOfSides) {
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        Text("10").tag(10)
                        Text("12").tag(12)
                        Text("20").tag(20)
                        Text("100").tag(100)
                    }
                    .pickerStyle(.segmented) // Optional for better style
                    Spacer() // Align to the right
                }
            } header: {
                Text("Number of sides on each die")
            }
            
            Section {
                Stepper(value: $numberOfDice, in: 1...6, step: 1) {
                    Text(numberOfDice == 1 ? "\(numberOfDice) die" : "\(numberOfDice) dice")
                }
            } header: {
                Text("Number of dice")
            }
        }
    }
}

#Preview {
    SettingsView()
}
