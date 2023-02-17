//
//  BetsView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BetsView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    @State var text: String = ""
    @State var allSelected: Bool = true
    @State var soccerSelected: Bool = false
    @State var basketSelected: Bool = false
    @State var tennisSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
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
                        ForEach(viewModel.bets.filter({
                            $0.home_team.name.contains(text) || $0.away_team.name.contains(text) 
                        })){ bet in
                            //NavigationLink(destination: DetailView(bet: bet)) {
                                if bet.sport == "soccer" {
                                    SoccerCardView(bet: bet)
                                } else if bet.sport == "basketball" {
                                    BasketballCardView(bet: bet)
                                } else if bet.sport == "basketball" {
                                    TennisCardView(bet: bet)
                                }
                            //}
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
                allSelected = true
                soccerSelected = false
                basketSelected = false
                tennisSelected = false
            }label: {
                Text("Todo")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(allSelected ? Color("Gray") : Color("LightGray"))
            .cornerRadius(35)
            
            Button {
                allSelected = false
                soccerSelected = true
                basketSelected = false
                tennisSelected = false
            }label: {
                Text("Fútbol")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(soccerSelected ? Color("Green") : Color("GreenButton"))
            .cornerRadius(35)
            
            Button {
                allSelected = false
                soccerSelected = false
                basketSelected = true
                tennisSelected = false
            }label: {
                Text("Baloncesto")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(basketSelected ? Color("Orange") : Color("OrangeButton"))
            .cornerRadius(35)
            
            Button {
                allSelected = false
                soccerSelected = false
                basketSelected = false
                tennisSelected = true
            }label: {
                Text("Tenis")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(tennisSelected ? Color("Yellow") : Color("YellowButton"))
            .cornerRadius(35)
        }
    }
}

struct BetsView_Previews: PreviewProvider {
    static var previews: some View {
        BetsView()
    }
}
