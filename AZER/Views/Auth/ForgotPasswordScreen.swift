//
//  ForgotPasswordScreen.swift
//  Azer
//
//  Created by Gehad Eid on 29/11/2023.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("yo, Forgot Password Screen!")
        Button{
            dismiss()
        }
    label:{
        HStack {
            Text("Already a member?")
            Text("Log in").underline()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    }
}

#Preview {
    ForgotPasswordScreen()
}
