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
                    
                    NotificationsView()
                        .tag(Tab.Pool)
                    
                    ProfileNavBar()
                        .tag(Tab.Profile)
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }.ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
