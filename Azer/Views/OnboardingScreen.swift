//
//  OnboardingScreen.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//


// test

import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        NavigationView{
            ZStack{
                //Background
                bgColor()
                TabView{
                    OnboardingView(imageName: "Understand", title: "Understand", description: "yourself on a deeper level")
                    
                    OnboardingView(imageName: "Challenge", title: "Challenge", description: "yourself for a better you")
                    
                    OnboardingView(imageName: "Protect", title: "Protect", description: "your inner peace", isFinal: true)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
//                .onAppear {
//                    setupAppearance()
//                }
            }
        }
    }
}


//                              - Methods -

// Change the color of the current page indecator
//func setupAppearance() {
//      UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("filter&selected"))
//    }



// - Onboarding single View -
struct OnboardingView: View {
    
    let imageName : String
    let title : String
    let description : String
    var isFinal = false
    
    var body: some View {
        VStack (spacing: 20){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300,height: 300)
                .foregroundColor(.teal)// change color
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                .foregroundColor(Color("primaryTextColor"))
            
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary) // change color (it's a keep 4 me)
            
            if isFinal{
                NavigationLink(destination: LoginScreen(), label:{
                    tcustomButton(title: "Get Started",color:"primaryButtonColor")
                })
            }
        }
        .padding(.horizontal,tdefaultPadding)
    }
}


#Preview {
    OnboardingScreen()
}
