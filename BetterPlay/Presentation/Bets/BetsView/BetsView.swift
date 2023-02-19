//
//  BetsView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BetsView: View {
    var body: some View {
        VStack(spacing: 0){
            VStack(spacing: 20) {
                logo
                
                //Searcher()
                
                filterButtons
                
                Rectangle().fill(Color("Gray")).frame(width: .infinity, height: 2, alignment: .center)
                
                
            }
            .padding(.top, 50)
            .background(Color("Background"))
               
            VStack {
                ScrollView {
                    LazyVStack {
                        SoccerCardView()
                        
                        BasketballCardView()
                        
                        TennisCardView()
                        
                        SoccerCardView()
                        
                        BasketballCardView()
                    }
                }
            }
            .padding(.top, 20)
            .background(Color("Background2"))
            
            CustomTabBar(selectedTab: .constant(.Bet))
        }
        .ignoresSafeArea()
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
                //Petición web
            }label: {
                Text("Todo")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color("Gray"))
            .cornerRadius(35)
            
            Button {
                //Partidos de fútbol
            }label: {
                Text("Fútbol")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color("GreenButton"))
            .cornerRadius(35)
            
            Button {
                //Partidos de baloncesto
            }label: {
                Text("Baloncesto")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color("OrangeButton"))
            .cornerRadius(35)
            
            Button {
                //partidos de tenis
            }label: {
                Text("Tenis")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color("YellowButton"))
            .cornerRadius(35)
        }
    }
}

struct BetsView_Previews: PreviewProvider {
    static var previews: some View {
        BetsView()
    }
}
