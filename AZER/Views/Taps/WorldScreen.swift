//
//  WorldScreen.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//

import SwiftUI

struct WorldScreen: View {
    
    @State private var isLoggedin = true
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            ZStack(alignment: .top) {
                topBar(height: 260)
                VStack (alignment: .leading, spacing: 0) {
                    // Moods
                    scrollableMoodSellection()
                    
                    if isLoggedin {
                        // 21 days challenge
                        cardWithTitle(
                            title: "21 days challenge", height: 70,
                            content: {
                                VStack(alignment: .leading , spacing: -5) {
                                    progressBar(height: 20, width: 0, padding: 10)
                                    
                                    Text("Day 11 / 21")
                                        .font(.footnote)
                                        .padding(.horizontal,12)
                                        .foregroundColor(.gray)
                                    
                                }
                            }
                        )
                        
                        // Mood tracker
                        cardWithTitle(
                            title: "Mood tracker", height: 120,
                            content: {
                                VStack{
                                    Spacer()
                                    Text("Past 6 days")
                                        .font(.footnote)
                                        .padding(.bottom,10)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(0..<5) { index in
                                                Image("Mood\(index)")
                                                    .resizable()
                                                    .foregroundStyle(.white)
                                                    .font(.largeTitle)
                                                    .frame(width: 60, height: 60)
                                            }
                                        }
                                        .padding(.horizontal, tdefaultPadding - 10)
                                    }
                                    Spacer()
                                    Spacer()
                                }
                            }
                        )
                        
                        // Rooms
                        currentRooms(title: "Allies are up to")
                        
                    } else {
                       // 21 days challenge
                       cardWithTitle(
                           title: "21 days challenge", height: 70,
                           content: {
                               VStack(alignment: .leading , spacing: -5) {
                                   progressBar(height: 20, width: 100, padding: 10)
                                   
                                   Text("Sign in to start your journey")
                                       .font(.footnote)
                                       .padding(.horizontal,10)
                                       .foregroundColor(.gray)
                                   
                               }
                           }
                       )
                       
                       // Mood tracker
                       cardWithTitle(
                           title: "Mood tracker", height: 100,
                           content: {
                               VStack{
                                   Spacer()
                                   Text("Past 6 days")
                                       .font(.footnote)
                                       .padding(.bottom,10)
                                       .foregroundColor(.gray)
                                   
                                   Spacer()
                                   
                                   Text("No entry yet, sign up to track your mood ")
                                       .font(.footnote)
                                       .padding(.horizontal,10)
                                       .foregroundColor(.gray)
                                   Spacer()
                               }
                           }
                       )
                       
                       // Rooms
                       cardWithTitle(
                           title: "Allies are up to", height: 100,
                           content: {
                               Text("Sign up and add friends to enjoy group challenges")
                                   .font(.footnote)
                                   .padding(.horizontal,10)
                                   .foregroundColor(.gray)
                           }
                       )
                   }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WorldScreen()
}
