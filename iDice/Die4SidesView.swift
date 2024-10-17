//
//  Die4SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 16/10/24.
//

import SwiftUI

struct Die4SidesView: View {
    @Binding var side: Int
    @State private var possibleSides = [1, 2, 3, 4]
    
    var body: some View {
        ZStack {
            Triangle()
                .fill(Color.green)
                .shadow(radius: 10)
            
            Text("\(side)")
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .offset(y: -15)
            
            if let firstChosenElement = possibleSides.filter({ $0 != side }).randomElement() {
                Text("\(firstChosenElement)")
                    .rotationEffect(Angle(degrees: -135))
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                    .offset(x: -25, y: 30)
                
                Text("\(possibleSides.filter({ $0 != side && $0 != firstChosenElement }).randomElement() ?? 2)")
                    .rotationEffect(Angle(degrees: 135))
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                    .offset(x: 25, y: 30)
            }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    Die4SidesView(side: .constant(1))
}
