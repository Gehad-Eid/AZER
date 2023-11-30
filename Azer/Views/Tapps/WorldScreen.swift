//
//  WorldScreen.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//

import SwiftUI

struct WorldScreen: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            ZStack(alignment: .top) {
                topBar(height: 260)
                VStack (alignment: .leading, spacing: 0) {
                    // Moods
                    scrollableMoodSellection()
                    
                    // 21 days challenge
                    cardWithTitle(
                        title: "21 days challenge", height: 70,
                        content: {
                            VStack(alignment: .leading , spacing: -5) {
                                progressBar(height: 20, width: 50, padding: 10)
                                
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
                                Text("Past 6 days")
                                    .font(.footnote)
                                    .padding(.bottom,10)
                                    .foregroundColor(.gray)
                                
                                Text("No entry yet, sign up to track your mood ")
                                    .font(.footnote)
                                    .padding(.horizontal,10)
                                    .foregroundColor(.gray)
                                
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
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WorldScreen()
}



struct cardWithTitle<Content: View>: View {
    let contentView: Content
    let title: String
    let height: CGFloat
    
    init(title: String, height: CGFloat, @ViewBuilder content: () -> Content) {
        self.title = title
        self.height = height
        self.contentView = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7){
            Text(title)
                .padding(.horizontal,tdefaultPadding)
                .padding(.top, tdefaultPadding)
                .font(.title2)
            
            ZStack{
                RoundedRectangle(cornerRadius: tcornerRadius)
                    .fill(.gray.opacity(0.2))
                    .frame(width: .infinity, height: height)
                
                // Whatever custom view we need to add on the card
                contentView
            }
            .padding(.horizontal,tdefaultPadding)
        }
    }
}
