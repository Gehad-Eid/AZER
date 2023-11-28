//
//  passed.swift
//  Azer
//
//  Created by asma on 14/05/1445 AH.
//
import SwiftUI

struct passed:
    View {
    var body: some View {
        
        ZStack{
            Image("back")
                .padding(.bottom, 400.0)
            Image("passed")
                .padding(.bottom, 300.0)
            Text("You Passed!")
                .font(
                Font.custom("Montserrat", size: 32)
                .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.01, green: 0.19, blue: 0.28))

                .padding(.top, 500.0)
                .frame(width: 252, alignment: .center)
        }

    }
}

#Preview {
    passed()
}
