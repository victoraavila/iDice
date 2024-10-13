//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    @State private var isRolling = false
    
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
                            
                            getDieView(for: $appState.sides[0], numberOfSides: appState.diceSettings.numberOfSides)
                                .padding(.horizontal)
                            
                            if (appState.diceSettings.numberOfDice > 1) {
                                getDieView(for: $appState.sides[1], numberOfSides: appState.diceSettings.numberOfSides)
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                        
                        if (appState.diceSettings.numberOfDice > 2) {
                            HStack {
                                Spacer()
                                
                                getDieView(for: $appState.sides[2], numberOfSides: appState.diceSettings.numberOfSides)
                                    .padding(.horizontal)
                                
                                if (appState.diceSettings.numberOfDice > 3) {
                                    getDieView(for: $appState.sides[3], numberOfSides: appState.diceSettings.numberOfSides)
                                        .padding(.horizontal)
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                        
                        if (appState.diceSettings.numberOfDice > 4) {
                            HStack {
                                Spacer()
                                
                                getDieView(for: $appState.sides[4], numberOfSides: appState.diceSettings.numberOfSides)
                                    .padding(.horizontal)
                                
                                if (appState.diceSettings.numberOfDice > 5) {
                                    getDieView(for: $appState.sides[5], numberOfSides: appState.diceSettings.numberOfSides)
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
                            appState.sides = appState.sides.map { _ in Int.random(in: 1...appState.diceSettings.numberOfSides) }
                            
                            if Int(firedDate.timeIntervalSince(startDate)) >= 1 {
                                isRolling = false
                                if appState.lastScores.count >= 5 {
                                    appState.lastScores.removeFirst()
                                }
                                appState.lastScores.append(appState.sides[0...appState.diceSettings.numberOfDice - 1].reduce(0, +))
                                appState.saveState()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            Text("Total")
                            Text("\(appState.sides[0...appState.diceSettings.numberOfDice - 1].reduce(0, +))")
                                .bold()
                                .font(.largeTitle)
                        }
                        CircularProgressView(progress: Double(appState.sides[0...appState.diceSettings.numberOfDice - 1].reduce(0, +)) / (Double(appState.diceSettings.numberOfSides)*Double(appState.diceSettings.numberOfDice)))
                    }
                    
                    Spacer()
                    
                    Button() {
                        isRolling = true
                        startDate = Date.now
                        appState.sides = appState.sides.map { _ in Int.random(in: 1...appState.diceSettings.numberOfSides) }
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
                    .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: appState.sides)
                    
                    Spacer()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $showBottomSheet, content: {
                    VStack {
                        Text("Previous results")
                            .padding(.top, 20)
                            .padding(.bottom)
                        
                        if detentAmount == .fraction(0.3) {
                            if appState.lastScores.count > 0 {
                                ForEach(appState.lastScores.reversed(), id: \.self) { score in
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
                    NavigationLink(destination: SettingsView().environmentObject(appState)) {
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
                appState.loadState()
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    }
    
    @ViewBuilder
    func getDieView(for side: Binding<Int>, numberOfSides: Int) -> some View {
        switch numberOfSides {
        case 6:
            Die6SidesView(side: side)
        case 8:
            Die8SidesView(side: side)
        case 10:
            Die10SidesView(side: side)
        // Add more cases for other die types
        default:
            Die6SidesView(side: side) // Default to 6-sided die or create a generic die view
        }
    }
}

#Preview {
    ContentView()
}


