//
//  challenge5.swift
//  Azer
//
//  Created by asma on 14/05/1445 AH.
//

import SwiftUI

struct Challenge5:
    View {
    var body: some View {
        
        ZStack{
            Image("back")
                .padding(.bottom, 400.0)
            Image("d")
                .padding(.bottom, 300.0)
            Text("Pet a Stray animal")
                .padding(.top, 100.0) .colorInvert()
                .font(
                    Font.custom("Montserrat", size: 20)
                        .weight(.semibold)
                )
        }
    }
}
    #Preview {
        Challenge5()
    }
