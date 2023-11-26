//
//  LoginScreen.swift
//  Azer
//
//  Created by Gehad Eid on 21/11/2023.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email  = ""
    @State private var password  = ""

    var body: some View {
        NavigationStack {
            ZStack{
                // Back ground color
                bgColor()
                // the waves in the bottom
                doubleWave()
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Spacer()
                    
                    // Email
                    tcustomTextfeild(text: $email, title: "Email", placeholder: "Enter your email", imageName: "envelope.fill")
                    
                    // Username
                    tcustomTextfeild(text: $email, title: "What should we call you?", placeholder: "Enter username", imageName: "person.fill")
                    
                    // Password
                    tcustomTextfeild(text: $email, title: "Protect your world!", placeholder: "Enter your password", imageName: "lock.fill", isSecure: true)
                    
                    // Stingth par
                    
                    // Confirm password
                    tcustomTextfeild(text: $email, title: "Confirm password", placeholder: "Confirm your password", imageName: "lock.fill", isSecure: true)
                    
                    // Button
                    tcustomButton(title: "Sign Up", color: "primaryButtonColor")
                    
                    Spacer()
                    
                    // Or And Sign In With Apple Button
                    customOrAndSignInWithAppleButton()
                    
                    Spacer()
                    
                    HStack {
                        Text("Already a member?")
                            .font(.footnote)
                        Text("Log in")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(tdefaultPadding)
            }
        }
    }
}


#Preview {
    LoginScreen()
}
