//
//  DiceSettings.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

class DiceSettings: ObservableObject {
    @Published var numberOfSides: Int = 6
    @Published var numberOfDice: Int = 1
}
