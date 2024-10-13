//
//  DiceSettings.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

class DiceSettings: ObservableObject, Codable {
    @Published var numberOfDice: Int = 2
    @Published var numberOfSides: Int = 6
    
    enum CodingKeys: String, CodingKey {
        case numberOfDice
        case numberOfSides
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(numberOfDice, forKey: .numberOfDice)
        try container.encode(numberOfSides, forKey: .numberOfSides)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        numberOfDice = try container.decode(Int.self, forKey: .numberOfDice)
        numberOfSides = try container.decode(Int.self, forKey: .numberOfSides)
    }
    
    init() {}
}
