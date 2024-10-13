//
//  Die8SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

struct Die8SidesView: View {
    @Binding var side: Int
    
    var body: some View {
        ZStack {
            Triangle8()
                .fill(.ultraThinMaterial)
                .shadow(radius: 10)
            
            Text("\(side)")
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .offset(y: 15)
        }
        .frame(width: 100, height: 100)
        .background {
            Triangle8()
                .fill(Color.blue)
        }
    }
}

struct Triangle8: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

#Preview {
    ZStack {
        Die8SidesView(side: .constant(1))
    }
}
