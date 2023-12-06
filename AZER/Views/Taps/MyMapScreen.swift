//
//  MyMapScreen.swift
//  Azer
//
//  Created by Gehad Eid on 29/11/2023.
//

import SwiftUI

struct MyMapScreen: View {
    var body: some View {
        
            ScrollView (showsIndicators: false) {
                
                    ZStack (alignment: .top){
                        VStack {
                            Rectangle()
                                .frame(height: 160) //width: .infinity,
                                .opacity(0)
                            
                            Image("Map")
                                .resizable()
                                .frame(maxWidth: .infinity,maxHeight:800)
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color("BackgoundDecoration"))
                                .frame( height: 170) //width: .infinity,
                            
                            HStack{
                                Image("Logo")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 10)
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    Text("Hi Bahaa!")
                                        .font(.title)
                                        .foregroundColor(Color("HeadlineColor"))
                                        .padding(tdefaultPadding)
                                    
                                    
                                }
                                
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
//                                NavigationLink (destination: SettingsScreen()){
                                    Image("Set")
                                        .resizable()
                                        .frame(width: 30,height: 30)
//                                }
                            }
                            .padding(tdefaultPadding)
                        }
                        .edgesIgnoringSafeArea(.top)
                    }
                
            }
            .edgesIgnoringSafeArea(.top)
        
    }
}

#Preview {
    MyMapScreen()
}
