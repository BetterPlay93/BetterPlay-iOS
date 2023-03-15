//
//  BetterPlayApp.swift
//  BetterPlay
//
//  Created by Apps2T on 30/1/23.
//

import SwiftUI

import SwiftUI
//import FirebaseCore


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct BetterPlayApp: App {
    // register app delegate for Firebase setup
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }.navigationBarHidden(true)
        }
    }
}
