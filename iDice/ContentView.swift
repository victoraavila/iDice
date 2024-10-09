//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var diceSettings = DiceSettings()
    
    @State private var side = 1
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Die6SidesView(side: $side)
                                .padding(.horizontal)
                            
                            if (diceSettings.numberOfDice > 1) {
                                Die6SidesView(side: $side)
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                        
                        if (diceSettings.numberOfDice > 2) {
                            HStack {
                                Spacer()
                                
                                Die6SidesView(side: $side)
                                    .padding(.horizontal)
                                
                                if (diceSettings.numberOfDice > 3) {
                                    Die6SidesView(side: $side)
                                        .padding(.horizontal)
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                        
                        if (diceSettings.numberOfDice > 4) {
                            HStack {
                                Spacer()
                                
                                Die6SidesView(side: $side)
                                    .padding(.horizontal)
                                
                                if (diceSettings.numberOfDice > 5) {
                                    Die6SidesView(side: $side)
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
                            Text("\(side)")
                                .bold()
                                .font(.largeTitle)
                        }
                        CircularProgressView(progress: Double(side) / Double(diceSettings.numberOfSides))
                    }
                    
                    Spacer()
                    
                    Button() {
                        side = Int.random(in: 1...diceSettings.numberOfSides)
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


