//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfSides = 6
    @State private var side = 1
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Die6SidesView(side: $side)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Button() {
                        side = Int.random(in: 1...numberOfSides)
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
                    NavigationLink(destination: SettingsView()) {
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


