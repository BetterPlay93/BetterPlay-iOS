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
                    BetsView().navigationBarBackButtonHidden(true)
                        .tag(Tab.Bet)
                    
                    NotificationsView().navigationBarBackButtonHidden(true)
                        .tag(Tab.Notification)
                    
                    PoolsView().navigationBarBackButtonHidden(true)
                        .tag(Tab.Pool)
                    
                    ProfileNavBar().navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .tag(Tab.Profile)
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }.ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
