//
//  SplashScreen.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var finshSplash = false
    @State private var showName = true
    @State var scaleAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color("SplashBGcolor")
            if finshSplash{
                WorldScreen()
            }else{
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .scaleEffect(scaleAmount)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
                    if showName{
                        Text("AZER")
                            .transition(.opacity)
                    }
                }
                
            }
        }
        .ignoresSafeArea()
        .onAppear(){
            // Shrink the logo
            withAnimation(.easeOut(duration: 1).delay(2)){
                showName.toggle()
                scaleAmount = 0.5
            }
            // Enlarge the logo
            withAnimation(.easeInOut(duration: 1).delay(3)){
                scaleAmount = 30
            }
            // Go to the main page (World page)
            DispatchQueue.main.asyncAfter(deadline: .now()+5){
                finshSplash.toggle()
            }
        }
    }
}

#Preview {
    SplashScreen()
}
