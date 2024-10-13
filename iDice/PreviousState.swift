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
    
    enum CodingKeys: String, CodingKey {
        case sides, lastScores
    }
    
    init(sides: [Int], lastScores: [Int]) {
        self.sides = sides
        self.lastScores = lastScores
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sides = try container.decode([Int].self, forKey: .sides)
        lastScores = try container.decode([Int].self, forKey: .sides)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sides, forKey: .sides)
        try container.encode(lastScores, forKey: .lastScores)
    }
}
