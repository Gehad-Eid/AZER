//
//  Challenge.swift
//  AZER
//
//  Created by Gehad Eid on 01/12/2023.
//

import SwiftUI

struct Challenge: View {
    let image : String
    let challenge : String
    
    @State var timer = false
    
    var body: some View {
        VStack {
            ZStack {
                // Background decoration
                UnevenRoundedRectangle(
                    cornerRadii: .init(bottomLeading: 120,
                                       bottomTrailing: 120)
                )
                .fill(Color("BackgoundDecoration"))
                .frame(height: 550) // width
                
                // The challenge
                VStack {
                    Image(image)
                        .resizable()
                        .frame( maxWidth: 200,maxHeight: 300)
                        .padding(.bottom, tdefaultPadding)
                    
                    Text(challenge)
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color("challengeTextColor"))
                }
            }
            
            Spacer()
            
            // Buttons
            if !timer{
                HStack (spacing: 24) {
                    tcustomButton(title: "Pass", color: "primaryTextColor")
                        .overlay(RoundedRectangle(cornerRadius: tcornerRadius)
                            .stroke(.black, lineWidth: 1.5))
                        .onTapGesture {
                            
                        }
                    
                    Spacer()
                    
                    tcustomButton(title: "Start Timer", color: "primaryButtonColor")
                        .foregroundColor(.white)
                        .onTapGesture {
                            timer = true
                        }
                }
                .padding(tdefaultPadding)
            }
            else{
                TimerView()
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .ignoresSafeArea()
    }
}

#Preview {
    Challenge(image: "", challenge: "")
}



struct TimerView: View {
    @State var timeRemaining = 24*60*60
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        Text("\(timeString(time: timeRemaining))")
            .font(.system(size: 60))
            .frame(height: 80.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.black)
            .onReceive(timer){ _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }else{
                    self.timer.upstream.connect().cancel()
                }
            }
    }
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
        let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
