//
//  components.swift
//  Azer
//
//  Created by Gehad Eid on 25/11/2023.
//

import SwiftUI
import AuthenticationServices


// Custom Button
struct tcustomButton: View {
    let title : String
    let color : String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: tbuttonHight)
            .background(Color(color))
            .cornerRadius(tcornerRadius)
//            .padding(tdefaultPadding)
    }
}



// Custom textfeild
struct tcustomTextfeild: View {
    @Binding var text : String
    let placeholder : String
    let imageName : String
    var isSecure = false
    
    var body: some View {
        VStack(alignment: .leading , spacing: 12){
            if isSecure{
                HStack {
                    Image(systemName: imageName)
                        .padding(.leading,10)
                    SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(.white))
                }
                .frame(width: 342, height: 48)
                .background(Color(red: 0.95, green: 0.81, blue: 0.73).opacity(0.27))
                .cornerRadius(8)
            }
            else{
                HStack {
                    Image(systemName: imageName)
                        .padding(.leading,10)
                    TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.white))
                }
                .frame(width: 342, height: 48)
                .background(Color(red: 0.95, green: 0.81, blue: 0.73).opacity(0.27))
                .cornerRadius(8)
            }
        }
    }
}



// Custom Or And Sign In With Apple Button
struct customOrAndSignInWithAppleButton: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 120, height: 0.5, alignment: .center)
                    .background(.white)
                
                Text("Or")
                    .font(Font.custom("Inter", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 120, height: 0.5, alignment: .center)
                    .background(.white)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            
            // Sign In With Apple Button
            SignInWithAppleButton(
                onRequest: { request in
                    
                },
                onCompletion: { result in
                    
                }
            )
            .frame(maxWidth: .infinity, maxHeight: tbuttonHight)
            .cornerRadius(tcornerRadius)
//            .padding()
        }
    }
}

// Custom wave shape
struct WaveShape: Shape {
    var yOffset: CGFloat // Controls the vertical position of the waves
    var amplitude: CGFloat // Controls the height of the waves
    var frequency: CGFloat // Controls the width of the waves

    // Function to create the path of the wave
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        // Move starting point to left edge of the view's center
        path.move(to: CGPoint(x: 0, y: rect.height / 2 + yOffset))
        
        let width = rect.width // Width of the view
        let height = rect.height // Height of the view
        
        // Loop to generate points for the wave shape
        for x in stride(from: 0, through: width, by: 10) {
            
            // Calculate y coordinate for each x point based on sine wave equation
            let y = sin((CGFloat(x) / width) * frequency * .pi * 2) * amplitude + rect.height/2 + yOffset
            
            // Add line to the calculated point
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        // Line to the bottom-right corner
        path.addLine(to: CGPoint(x: width, y: height))
        
        // Line to the bottom-left corner
        path.addLine(to: CGPoint(x: 0, y: height))
        
        path.close()
        
        return Path(path.cgPath)
    }
}


struct doubleWave: View {
    var body: some View {
        ZStack {
            WaveShape(yOffset: -50, amplitude: 20, frequency: 1)
                .fill(wgColor)
                .frame(height: 75)
                .opacity(0.9)
            
            // The mirrored wave
            WaveShape(yOffset: -50, amplitude: 20, frequency: 1)
                .fill(wgColor)
                .frame(height: 75)
                .scaleEffect(x: -1, y: 1) // Mirroring around the y-axis
                .opacity(0.8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

// Custom top bar
struct topBar: View {
    let height : CGFloat
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(
                cornerRadii: .init(bottomLeading: 120,
                                   bottomTrailing: 120)
            )
            .fill(Color("BackgoundDecoration"))
            .frame(width: .infinity, height: height)
            
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Hi there!")
                        .font(.title)
                        .foregroundColor(Color("HeadlineColor"))
                    
                    Text("Ready to change your mood?")
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            .padding(tdefaultPadding)
        }
        .edgesIgnoringSafeArea(.top)
    }
}


// Scrollable Mood Sellection
struct scrollableMoodSellection: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: .infinity,height: 190)
                .opacity(0)
            
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<5) {
                        Image("Mood\($0)")
                            .resizable()
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(width: 90, height: 90)
                        
//                        Text("Description")
//                            .foregroundColor(.white)
//                            .font(.caption)
//                            .padding(4)
//                            .background(Color.black.opacity(0.7))
//                            .cornerRadius(4)
//                            .shadow(color: .black, radius: 4, x: 0, y: 2)
                    }
                }
            }
            .padding(.horizontal, tdefaultPadding - 10)
        }
    }
}

// Custom progress bar
struct progressBar: View {
    
    let height : CGFloat
    let width : CGFloat
    let padding : CGFloat
    
    var body: some View {
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: .infinity, height: height)
                .foregroundColor(.black.opacity(0.1))
                .padding(padding)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .background(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: Color(red: 0.95, green: 0.81, blue: 0.73).opacity(0.8), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.95, green: 0.43, blue: 0.47).opacity(0.8), location: 1.00),
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: tcornerRadius, style: .continuous))
                )
                .foregroundColor(.clear)
                .padding(padding)
        }
    }
}
