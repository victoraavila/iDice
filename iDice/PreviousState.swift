//
//  PreviousState.swift
//  iDice
//
//  Created by Víctor Ávila on 13/10/24.
//

import Foundation

struct PreviousState: Codable {
    let sides: [Int]
    let lastScores: [Int]
    let diceSettings: DiceSettings
    
    enum CodingKeys: String, CodingKey {
        case sides, lastScores, diceSettings
    }
    
    init(sides: [Int], lastScores: [Int], diceSettings: DiceSettings) {
        self.sides = sides
        self.lastScores = lastScores
        self.diceSettings = diceSettings
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sides = try container.decode([Int].self, forKey: .sides)
        lastScores = try container.decode([Int].self, forKey: .lastScores)
        diceSettings = try container.decode(DiceSettings.self, forKey: .diceSettings)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sides, forKey: .sides)
        try container.encode(lastScores, forKey: .lastScores)
        try container.encode(diceSettings, forKey: .diceSettings)
    }
}
