//
//  LoginScreen.swift
//  Azer
//
//  Created by Gehad Eid on 21/11/2023.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        ZStack{
            bgColor()
            VStack(alignment: .leading, spacing: 15){
                Text("Email")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                Text("What should we call you?")
                
                Text("Protect your world!")
                
                Text("Confirm password")

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(tdefaultPadding)
        }
    }
}

#Preview {
    LoginScreen()
}


