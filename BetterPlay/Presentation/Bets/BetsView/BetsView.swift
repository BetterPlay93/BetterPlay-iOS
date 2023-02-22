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
                    logo
                    
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
                //viewModel.getAllBets()
                //Esto dependerá de si la fecha del userDefaults de inicio a la app es un día más
                showDailyStreak = true
            }
            
            
            DailyStreakView(isShowing: $showDailyStreak)
        }
    }
    
    
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 116, height: 75)
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
            
            Button {
                sportSelected = .tennis
            }label: {
                Text("Tenis")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(sportSelected == .tennis ? Color("Yellow") : Color("YellowButton"))
            .cornerRadius(35)
        }
    }
}

struct BetsView_Previews: PreviewProvider {
    static var previews: some View {
        BetsView()
    }
}
