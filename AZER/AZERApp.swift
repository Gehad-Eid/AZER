//
//  AzerApp.swift
//  Azer
//
//  Created by Gehad Eid on 19/11/2023.
//

import SwiftUI

@main
struct AZERApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}

// To hide NavigationBar globaly without losing swipe back gesture
extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
}
