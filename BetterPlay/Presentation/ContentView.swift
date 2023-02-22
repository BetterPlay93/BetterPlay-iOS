//
//  ContentView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .Bet
            
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    BetsView()
                        .tag(Tab.Bet)
                    
                    NotificationsView()
                        .tag(Tab.Notification)
                    
                    Color.black.navigationBarHidden(true)
                        .tag(Tab.Pool)
                    
                    ProfileNavBar(username: "Juan Ramón").navigationBarHidden(true)
                        .tag(Tab.Profile)
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
