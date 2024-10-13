//
//  Die10SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

struct Die10SidesView: View {
    @Binding var side: Int
    
    var body: some View {
        ZStack {
            Diamond()
                .fill(Color.orange)
                .shadow(radius: 10)
            
            Text("\(side)")
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .offset(y: 15)
        }
        .frame(width: 100, height: 100)
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let height = rect.height
            let bottomY = height * 0.75 // Adjust this value to change the height of the bottom point

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: bottomY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: bottomY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

#Preview {
    Die10SidesView(side: .constant(1))
}

