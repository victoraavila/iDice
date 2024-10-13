//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var diceSettings = DiceSettings()
    
    @State private var sides: [Int] = [1, 0, 0, 0, 0, 0]
    
    // To flick through multiple rolls instead of setting up a final value
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    @State private var isRolling = false
    
    // Storing previous results
    @State var lastScores: [Int] = []
    @State private var showBottomSheet = true
    @State private var detentAmount: PresentationDetent = .fraction(0.07)
    
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
                    .onReceive(timer) { firedDate in
                        if isRolling {
                            sides = sides.map { _ in Int.random(in: 1...diceSettings.numberOfSides) }
                            
                            if Int(firedDate.timeIntervalSince(startDate)) >= 1 {
                                isRolling = false
                                if lastScores.count >= 5 {
                                    lastScores.removeFirst()
                                }
                                lastScores.append(sides[0...diceSettings.numberOfDice - 1].reduce(0, +))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            Text("Total")
                            Text("\(sides[0...diceSettings.numberOfDice - 1].reduce(0, +))")
                                .bold()
                                .font(.largeTitle)
                        }
                        CircularProgressView(progress: Double(sides[0...diceSettings.numberOfDice - 1].reduce(0, +)) / (Double(diceSettings.numberOfSides)*Double(diceSettings.numberOfDice)))
                    }
                    
                    Spacer()
                    
                    Button() {
                        isRolling = true
                        startDate = Date.now
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
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures VStack takes all available space
                .sheet(isPresented: $showBottomSheet, content: {
                    VStack {
                        Text("Previous results")
                            .padding(.top, 20)
                            .padding(.bottom)
                        
                        if detentAmount == .fraction(0.3) {
                            if lastScores.count > 0 {
                                ForEach(lastScores.reversed(), id: \.self) { score in
                                    Text("\(score)")
                                }
                            }
                        }
                        
                        Spacer()
                    }
                        .interactiveDismissDisabled()
                        .presentationBackgroundInteraction(.enabled)
                        .presentationDetents([.fraction(0.07), .fraction(0.3)], selection: $detentAmount)
                        .presentationDragIndicator(.visible)
                        .ignoresSafeArea()
                })
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
                    .simultaneousGesture(TapGesture().onEnded {
                        showBottomSheet = false
                    })
                }
            }
            .onAppear {
                showBottomSheet = true
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    }
}

#Preview {
    ContentView()
}


