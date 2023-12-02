//
//  Challenge.swift
//  AZER
//
//  Created by Gehad Eid on 01/12/2023.
//

import SwiftUI

struct Challenge: View {
    let image : String
    let challenge : String
    
    var body: some View {
        VStack {
            ZStack {
                // Background decoration
                UnevenRoundedRectangle(
                    cornerRadii: .init(bottomLeading: 120,
                                       bottomTrailing: 120)
                )
                .fill(Color("BackgoundDecoration"))
                .frame(width: .infinity, height: 550)
                
                // The challenge
                VStack {
                    Image(image)
                        .resizable()
                        .frame( maxWidth: 200,maxHeight: 300)
                        .padding(.bottom, tdefaultPadding)
                    
                    Text(challenge)
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color("challengeTextColor"))
                }
            }
            
            Spacer()
            
            // Buttons
            HStack (spacing: 24) {
                tcustomButton(title: "Start Timer", color: "primaryButtonColor")
                    .foregroundColor(.white)
                
                Spacer()
                
                tcustomButton(title: "Pass", color: "")
                    .overlay(RoundedRectangle(cornerRadius: tcornerRadius)
                        .stroke(.black, lineWidth: 1.5))
            }
            .padding(tdefaultPadding)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .ignoresSafeArea()
    }
}

#Preview {
    Challenge(image: "", challenge: "")
}
