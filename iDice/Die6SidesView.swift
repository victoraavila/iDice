//
//  Die6SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

struct Die6SidesView: View {
    @Binding var side: Int
    
    private let dotPositions: [[Bool]] = [
        [false, false, false, false, true, false, false, false, false],  // 1
        [true, false, false, false, false, false, false, false, true],   // 2
        [true, false, false, false, true, false, false, false, true],    // 3
        [true, false, true, false, false, false, true, false, true],     // 4
        [true, false, true, false, true, false, true, false, true],      // 5
        [true, true, true, false, false, false, true, true, true]        // 6
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.white)
                .shadow(radius: 10)
                .frame(width: 100, height: 100)
            
            VStack(spacing: 10) {
                ForEach(0..<3) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<3) { column in
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(dotPositions[safeIndex][row * 3 + column] ? .black : .clear)
                        }
                    }
                }
            }
            .frame(width: 100, height: 100)
        }
    }
    
    private var safeIndex: Int {
        max(0, min(side - 1, dotPositions.count - 1))
    }
}

#Preview {
    Die6SidesView(side: .constant(1))
}
