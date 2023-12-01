//
//  Challenge.swift
//  AZER
//
//  Created by Gehad Eid on 01/12/2023.
//

import SwiftUI

struct Challenge: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading, spacing: 0) {
                UnevenRoundedRectangle(
                    cornerRadii: .init(bottomLeading: 120,
                                       bottomTrailing: 120)
                )
                .fill(Color("BackgoundDecoration"))
                .frame(width: .infinity, height: 550)
                
                Text("yo yo, challenge!")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    Challenge()
}
