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
                    Text("Welcome!")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    
                    // Email
                    tcustomTextfeild(text: $email, placeholder: "Email", imageName: "envelope.fill")
                    
                    // Password
                    tcustomTextfeild(text: $password, placeholder: "Password", imageName: "lock.fill", isSecure: true)
                    
                    HStack {
                        NavigationLink(
                            destination: ForgotPasswordScreen(),
                            label:{ Text("Forgot password?").underline().font(.footnote)
                        })
                                
                        Spacer()
                        
                        NavigationLink(
                            destination: SignUpScreen(),
                            label:{ Text("Not a member?").underline().font(.footnote)
                        })
                        
                    }
                    
                    
                    // Button
                    NavigationLink(
                        destination: MainTabbedView(),
                        label:{ tcustomButton(title: "Login", color: "primaryButtonColor")
                    })
                    
                    
                    // Or And Sign In With Apple Button
                    customOrAndSignInWithAppleButton()
                                        
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(tdefaultPadding)
            }
            .foregroundColor(.white)
        }
    }
}


#Preview {
    LoginScreen()
}
