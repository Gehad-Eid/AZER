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
    @EnvironmentObject var userModel : UserModel
    
//    @State var finishLogin = false

    var body: some View {
        NavigationStack {
            //        if !finishLogin {
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
                        .autocapitalization(.none)
                    
                    // Password
                    tcustomTextfeild(text: $password, placeholder: "Password", imageName: "lock.fill", isSecure: true)
                    
                    HStack {
                        //                        Button("Forgot password?", action: UserModel.logPressed).font(.footnote)
                        NavigationLink(
                            destination: ForgotPasswordScreen().navigationBarBackButtonHidden(true),
                            label:{ Text("Forgot password?").underline().font(.footnote)
                            })
                        
                        Spacer()
                        
                        //                        Button("Not a member?", action: UserModel.logPressed).font(.footnote)
                        NavigationLink(
                            destination: SignUpScreen().navigationBarBackButtonHidden(true),
                            label:{ Text("Not a member?").underline().font(.footnote)
                            })
                    }
                    
                    
                    // Button
                    Button{
                        userModel.authenticate(username: email, password: password)
                    }
                label: {
                        tcustomButton(title: "Login", color: "primaryButtonColor")
                    }
                    
                    //                    tcustomButton(title: "Login", color: "primaryButtonColor")
                    //                        .onTapGesture {
                    ////                            finishLogin = true
                    //                            UserModel.authenticate()
                    //                        }
                    
                    
                    // Or And Sign In With Apple Button
                    customOrAndSignInWithAppleButton()
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(tdefaultPadding)
            }
            .foregroundColor(.white)
            //        }
            //        else{
            //            MainTabbedView(loged: true)
        }
    }
}


#Preview {
    LoginScreen()
}
