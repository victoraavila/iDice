//
//  Die6SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

struct Die6SidesView: View {
    @Binding var side: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.white)
                .shadow(radius: 10)
                .frame(width: 100, height: 100)
            
            if (side == 1) {
                Circle()
                    .frame(width: 20)
            }
            
            else if (side == 2) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                }
                .frame(width: 100)
            }
            
            else if (side == 3) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                }
                .frame(width: 100)
            }
            
            else if (side == 4) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                }
                .frame(width: 100)
            }
            
            else if (side == 5) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Circle()
                            .frame(width: 20)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                }
                .frame(width: 100)
            }
            
            else if (side == 6) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 20)
                        
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
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.white)
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
                        
                        Circle()
                            .frame(width: 20)
                        
                        Spacer()
                    }
                }
                .frame(width: 100)
            }
            
        }
    }
}

#Preview {
    Die6SidesView(side: .constant(4))
}
