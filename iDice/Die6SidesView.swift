//
//  Die6SidesView.swift
//  iDice
//
//  Created by Víctor Ávila on 08/10/24.
//

import SwiftUI

struct Die6SidesView: View {
    @State private var face = 6
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.white)
                .shadow(radius: 10)
                .frame(width: 100, height: 100)
            
            if (face == 1) {
                Circle()
                    .frame(width: 20)
            }
            
            else if (face == 2) {
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
            
            else if (face == 3) {
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
            
            else if (face == 4) {
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
            
            else if (face == 5) {
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
            
            else if (face == 6) {
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
    Die6SidesView()
}
