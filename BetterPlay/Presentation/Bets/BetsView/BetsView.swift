//
//  BetsView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BetsView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State var showDailyStreak: Bool = false
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
                            ForEach(viewModel.filteredBets(by: text, and: sportSelected)) { bet in
                                
                                SportCard(bet: bet)
                                
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
                viewModel.getAllBets()
                //Esto dependerá de si la fecha del userDefaults de inicio a la app es un día más
                showDailyStreak = true
            }
            
            
            //DailyStreakView(isShowing: $showDailyStreak)
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
            
            filterButton(sport: .tennis, textSport: "Tenis", color: "Yellow")
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

struct BetsView_Previews: PreviewProvider {
    static var previews: some View {
        BetsView()
    }
}
