//
//  Challeng.swift
//  Azer
//
//  Created by asma on 14/05/1445 AH.
//

import SwiftUI

struct Challenge: View {
    var body: some View {
        
        ZStack{
            Image("back")
                .padding(.bottom, 400.0)
            
            Image("walk")
                .padding(.bottom, 300.0)
            Text("Take a 10 Minutes Walk")
                .padding(.top, 100.0) .colorInvert()
                .font(
                    Font.custom("Montserrat", size: 20)
                        .weight(.semibold)
                )
            
            // Button
            
            Text("start timer")
                
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .padding(.top, 500.0)
            
            
        }
        
      
        
    }
}

#Preview {
    Challenge()
}
