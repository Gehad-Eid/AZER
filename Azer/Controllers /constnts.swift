//
//  constnts.swift
//  Azer
//
//  Created by Gehad Eid on 20/11/2023.
//

import Foundation
import SwiftUI

//                      - Consts -
let tdefaultPadding : CGFloat = 30
let tcornerRadius : CGFloat = 12
let tbuttonHight : CGFloat = 50



//                      - Style -

// Wave Gradient color for splash, login and onboarding screens
let wgColor = LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(red: 0.95, green: 0.81, blue: 0.73).opacity(0.8), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.95, green: 0.43, blue: 0.47).opacity(0.8), location: 1.00),
                ]),
                startPoint: UnitPoint(x: 0.5, y: 1.04),
                endPoint: UnitPoint(x: 0.5, y: 0.11)
            )



// Background Gradient color for login and onboarding screens
struct bgColor: View {
    var body: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.17, green: 0.3, blue: 0.27), location: 0.00),
                Gradient.Stop(color: Color(red: 0.53, green: 0.75, blue: 0.71), location: 0.16),
                Gradient.Stop(color: Color(red: 0.74, green: 0.89, blue: 0.99), location: 0.34),
                Gradient.Stop(color: Color(red: 1, green: 1, blue: 1), location: 0.59),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0.18),
            endPoint: UnitPoint(x: 0.5, y: 2.17)
        )
        .edgesIgnoringSafeArea(.all)
    }
}
