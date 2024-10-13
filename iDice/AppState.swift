//
//  AppState.swift
//  iDice
//
//  Created by Víctor Ávila on 13/10/24.
//

import Foundation

class AppState: ObservableObject, Codable {
    @Published var diceSettings: DiceSettings
    @Published var sides: [Int]
    @Published var lastScores: [Int]
    
    enum CodingKeys: String, CodingKey {
        case diceSettings, sides, lastScores
    }
    
    init() {
        self.diceSettings = DiceSettings()
        self.sides = [1, 0, 0, 0, 0, 0]
        self.lastScores = []
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(diceSettings, forKey: .diceSettings)
        try container.encode(sides, forKey: .sides)
        try container.encode(lastScores, forKey: .lastScores)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        diceSettings = try container.decode(DiceSettings.self, forKey: .diceSettings)
        sides = try container.decode([Int].self, forKey: .sides)
        lastScores = try container.decode([Int].self, forKey: .lastScores)
    }
    
    func saveState() {
        do {
            let savePath = URL.documentsDirectory.appending(path: "AppState")
            let data = try JSONEncoder().encode(self)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save app state.")
        }
    }
    
    func loadState() {
        do {
            let savePath = URL.documentsDirectory.appending(path: "AppState")
            let data = try Data(contentsOf: savePath)
            let loadedState = try JSONDecoder().decode(AppState.self, from: data)
            self.diceSettings = loadedState.diceSettings
            self.sides = loadedState.sides
            self.lastScores = loadedState.lastScores
        } catch {
            print("Unable to load app state. Using default values.")
        }
    }
}
