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
    @State var sportSelected: Sport = .all
    
    var body: some View {
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
                            //NavigationLink(destination: DetailView(bet: bet)) {
                            if bet.sport == .soccer{
                                SoccerCardView(bet: bet)
                            } else if bet.sport == .basketball {
                                BasketballCardView(bet: bet)
                            } else if bet.sport == .tennis {
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
            //viewModel.getAllBets()
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
