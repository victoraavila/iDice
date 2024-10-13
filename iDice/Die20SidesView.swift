//
//  Die20SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 13/10/24.
//

import SwiftUI

struct Die20SidesView: View {
    @Binding var side: Int
    
    var body: some View {
        ZStack {
            Triangle()
                .fill(Color.purple)
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

#Preview {
    Die20SidesView(side: .constant(17))
}
