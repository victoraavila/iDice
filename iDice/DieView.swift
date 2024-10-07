//
//  DieView.swift
//  iDice
//
//  Created by Víctor Ávila on 07/10/24.
//

import SwiftUI

struct DieView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.white)
                .shadow(radius: 10)
                .frame(width: 100, height: 100)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 20)
                    
                    Spacer()
                }
            }
            .frame(width: 100)
            
        }
    }
}

#Preview {
    DieView()
}
