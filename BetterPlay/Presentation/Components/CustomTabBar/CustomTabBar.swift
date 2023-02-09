//
//  CustomTabBar.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable {
    case Bet
    case Notification
    case Pool
    case Profile
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    private var selectImage: String {
        selectedTab.rawValue + "Selected"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(selectedTab == tab ? selectImage : tab.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)){
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 80)
            .background(Color("DarkGray"))
        }
    }
}
