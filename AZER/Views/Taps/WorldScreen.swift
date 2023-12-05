//
//  WorldScreen.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//

import SwiftUI

struct WorldScreen: View {
    //    let isLoggedin: Bool
    //    @State private var isLogged = false
    @State private var showLoginAlert = false
    
//    let challenges = [
//        "Take a 10 minutes walk",
//        "Sing out loud",
//        "Meditate on candlelight",
//        "Hug the nearest person around",
//        "Pet a stray animal"
//    ]
//    
    @EnvironmentObject var userModel : UserModel
    let challenges = [
        "Take a 10 minutes walk",
        "Sing out loud",
        "Meditate on candlelight",
        "Hug the nearest person around",
        "Pet a stray animal"
    ]
    
    @State private var selectedChallenge: Int?
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                ZStack(alignment: .top) {
                    topBar(height: 260)
                        .edgesIgnoringSafeArea(.top)
                    VStack (alignment: .leading, spacing: 0) {
                        if userModel.authenticated {
                            // Moods
//                            ScrollableMoodSelection(isSheetPresented: $isSheetPresented)
                            VStack {
                                Rectangle()
                                    .frame(height: 190)
                                    .opacity(0)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(0..<5) { index in
                                            Image("Mood\(index)")
                                                .resizable()
                                                .foregroundStyle(.white)
                                                .font(.largeTitle)
                                                .frame(width: 90, height: 90)
                                                .onTapGesture {
                                                    isSheetPresented.toggle()
                                                    selectedChallenge = index
                                                }
                                                .sheet(isPresented: $isSheetPresented){
                                                    Challenge(image: "challenge\(selectedChallenge ?? 0)", challenge: challenges[selectedChallenge ?? 0])
                                                }
                                        }
                                    }
                                }
                                .padding(.horizontal, tdefaultPadding - 10)
                            }
                            
                            
                            // 21 days challenge
                            cardWithTitle(
                                title: "21 days challenge", height: 70,
                                content: {
                                    VStack(alignment: .leading , spacing: -5) {
                                        if let days = userModel.getCurrentUserDays() {
                                            ProgressBar(height: 20, padding: 10, completedDays: days )
                                            
                                            Text("Day \(days) / 21")
                                                .font(.footnote)
                                                .padding(.horizontal, 12)
                                                .foregroundColor(.gray)
                                        } else {
                                            ProgressBar(height: 20, padding: 20, completedDays: 0 )
                                            
                                            // A default value if days is nil
                                            Text("Day N/A / 21")
                                                .font(.footnote)
                                                .padding(.horizontal, 12)
                                                .foregroundColor(.gray)
                                        }
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
                                                ForEach(userModel.getLastSixElementsOfCurrentUserArray().suffix(6), id: \.self) { mood in
                                                    Image("Mood\(mood)")
                                                        .resizable()
                                                        .foregroundColor(.white)
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
                            
                        }
                        
                        // MARK: Not Logged in
                        else {
                            //Moods
                            ScrollableMoodSelection(isSheetPresented: $isSheetPresented)
                                .onTapGesture(perform: {
                                    showLoginAlert = true
                                })
                            
                            // 21 days challenge
                            cardWithTitle(
                                title: "21 days challenge", height: 70,
                                content: {
                                    VStack(alignment: .leading , spacing: -5) {
                                        //                                    progressBar(height: 20, width: 10, padding: 10)
                                        ProgressBar(height: 20, padding: 10, completedDays: 0 )
                                        
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
                    .alert(isPresented: $showLoginAlert) {
                        Alert(
                            title: Text("Login Required"),
                            message: Text("Please log in to access this content."),
                            primaryButton: .default(Text("Log In"), action: {
                                //                                isLogged = true
                            }),
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    WorldScreen()
}
