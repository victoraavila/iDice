//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var diceSettings = DiceSettings()
    
    @State private var sides: [Int] = [1, 0, 0, 0, 0, 0]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Die6SidesView(side: $sides[0])
                                .padding(.horizontal)
                            
                            if (diceSettings.numberOfDice > 1) {
                                Die6SidesView(side: $sides[1])
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                        
                        if (diceSettings.numberOfDice > 2) {
                            HStack {
                                Spacer()
                                
                                Die6SidesView(side: $sides[2])
                                    .padding(.horizontal)
                                
                                if (diceSettings.numberOfDice > 3) {
                                    Die6SidesView(side: $sides[3])
                                        .padding(.horizontal)
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                        
                        if (diceSettings.numberOfDice > 4) {
                            HStack {
                                Spacer()
                                
                                Die6SidesView(side: $sides[4])
                                    .padding(.horizontal)
                                
                                if (diceSettings.numberOfDice > 5) {
                                    Die6SidesView(side: $sides[5])
                                        .padding(.horizontal)
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                    }
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            Text("Total")
                            Text("\(sides.reduce(0, +))")
                                .bold()
                                .font(.largeTitle)
                        }
                        CircularProgressView(progress: Double(sides.reduce(0, +)) / (Double(diceSettings.numberOfSides)*Double(diceSettings.numberOfDice)))
                    }
                    
                    Spacer()
                    
                    Button() {
                        sides = sides.map { _ in Int.random(in: 1...diceSettings.numberOfSides) }
                    } label: {
                        Text("ROLL")
                            .bold()
                            .kerning(5.0)
                            .foregroundStyle(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 300, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .foregroundStyle(.gray.opacity(0.5))
                            )
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures VStack takes all available space
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("iDice")
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView().environmentObject(diceSettings)) {
                        Image(systemName: "gearshape.circle.fill")
                            .foregroundStyle(.gray)
                            .font(.title)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


