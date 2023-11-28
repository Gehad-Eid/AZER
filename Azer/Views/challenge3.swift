//
//  challenge3.swift
//  Azer
//
//  Created by asma on 14/05/1445 AH.
//

import SwiftUI

struct Challenge3:
    View {
    var body: some View {
        
        ZStack{
            Image("back")
                .padding(.bottom, 400.0)
            Image("m")
                .padding(.bottom, 300.0)
            Text("Meditate on Candlelight")
                .padding(.top, 100.0) .colorInvert()
                .font(
                    Font.custom("Montserrat", size: 20)
                        .weight(.semibold)
                )
        }
    }
}
    #Preview {
        Challenge3()
    }

