//
//  Die12SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 13/10/24.
//

import Foundation
import SwiftUI

struct Die100SidesView: View {
    @Binding var side: Int
    
    var body: some View {
        ZStack {
            PentagonInverted()
                .fill(Color.indigo)
                .shadow(radius: 10)
            
            Text("\(side)")
                .bold()
                .font(.title)
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 100)
    }
}

struct PentagonInverted: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        let angle = (2 * Double.pi) / 5
        
        return Path { path in
            for i in 0..<5 {
                let x = center.x + radius * cos(angle * Double(i) + .pi / 2)
                let y = center.y + radius * sin(angle * Double(i) + .pi / 2)
                
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            path.closeSubpath()
        }
    }
}


#Preview {
    Die100SidesView(side: .constant(1))
}

