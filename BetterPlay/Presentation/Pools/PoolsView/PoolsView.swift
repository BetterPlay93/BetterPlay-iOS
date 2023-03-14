//
//  PoolsView.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import SwiftUI

struct PoolsView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    @State var text: String = ""
    @State var sportSelected: Sport = .all
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    
                    Logo()
                    
                    Searcher(text: $text)
                    
                    filterButtons
                    
                    Rectangle().fill(Color("Gray")).frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                    
                }
                .padding(.top, 50)
                .background(Color("Background"))
                   
                VStack {
                    ScrollView {
                        LazyVStack {
                            PoolCard(sport: .soccer, color: "Green")
                            PoolCard(sport: .soccer, color: "Green")
                            PoolCard(sport: .basketball, color: "Orange")
                        }
                    }
                }
                .padding(.top, 20)
                .background(Color("Background2"))
                
                CustomTabBar(selectedTab: .constant(.Bet))
            }
            .ignoresSafeArea()
            .onAppear() {
                viewModel.getAllPools()
            }
            
        }
    }
    
    var filterButtons: some View {
        HStack {
            Button {
                sportSelected = .all
            }label: {
                Text("Todo")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(sportSelected == .all ? Color("Gray") : Color("LightGray"))
            .cornerRadius(35)
            
            Button {
                sportSelected = .soccer
            }label: {
                Text("Fútbol")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(sportSelected == .soccer ? Color("Green") : Color("GreenButton"))
            .cornerRadius(35)
            
            Button {
                sportSelected = .basketball
            }label: {
                Text("Baloncesto")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(sportSelected == .basketball ? Color("Orange") : Color("OrangeButton"))
            .cornerRadius(35)
        }
    }
}

struct PoolsView_Previews: PreviewProvider {
    static var previews: some View {
        PoolsView()
    }
}
