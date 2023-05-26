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
                            ForEach(viewModel.filteredPools(by: text, and: sportSelected)) { pool in
                                
                                PoolCard(pool: pool, color: "Green")
                                
                            }
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
            
            filterButton(sport: .soccer, textSport: "Fútbol", color: "Green")
            
            filterButton(sport: .basketball, textSport: "Baloncesto", color: "Orange")
        }
    }
    
    func filterButton(sport: Sport, textSport: String, color: String) -> some View {
        Button {
            sportSelected = sport
        }label: {
            Text(textSport)
                .foregroundColor(.white)
                .font(.system(size: 14))
        }
        .padding(5)
        .padding(.horizontal, 5)
        .background(sportSelected == sport ? Color(color) : Color("\(color)Button"))
        .cornerRadius(35)
    }
}

struct PoolsView_Previews: PreviewProvider {
    static var previews: some View {
        PoolsView()
    }
}


