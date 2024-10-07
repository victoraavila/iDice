//
//  ContentView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            DieView()
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

