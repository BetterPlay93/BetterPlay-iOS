//
//  BasketballCardView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BasketballCardView: View {
    var bet: BetPresentationModel
   
    var body: some View {
        HStack(spacing: 10){
            Image("BasketballCard")
                .resizable()
                .scaledToFit()
                .frame(width: 107, height: 107)
               
            VStack(alignment: .leading, spacing: 8){
                players
                
                teams
                   
                dateAndPlayButton
            }
               
        }
        .frame(width: 359, height: 107)
        .background(.white)
        .cornerRadius(10)
    }
    
    var players: some View {
        HStack(){
            Image(systemName: "person.2.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(Color("Orange"))
                
            
            Text("203")
                .font(.system(size: 13))
                .foregroundColor(Color("Gray"))
                .bold()
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 10)
    }
    
    var teams: some View {
        HStack(spacing: 8){
            VStack(alignment: .leading){
                Image("HomeBasketball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13, height: 15)
                
                Image("AwayBasketball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17.6, height: 15)
                
            }
            
            VStack(alignment: .leading){
                Text("\(bet.home_team.name)")
                    .foregroundColor(Color("Orange"))
                    .bold()
                
                Text("\(bet.away_team.name)")
                    .foregroundColor(Color("Orange"))
                    .bold()
            }
        }
    }
    
    var dateAndPlayButton: some View {
        HStack {
            Image("CalendarBasketball")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
               
            Text(convertTimestampToDate(date: bet.date))
                .font(.system(size: 13))
                .foregroundColor(Color("Gray"))
                .bold()
               
            Image(systemName: "clock")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("Orange"))
                .frame(width: 18, height: 18)
               
            Text(convertTimestampToHour(date: bet.date))
                .font(.system(size: 13))
                .foregroundColor(Color("Gray"))
                .bold()
            
               
            Button {
                   
            } label: {
                Text("Jugar")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 67, height: 24)
                    .background(Color("Orange"))
                    .cornerRadius(20)
            }.padding(.leading, 10)
        }.padding(.bottom, 5)
    }
}

struct BasketballCardView_Previews: PreviewProvider {
    static var previews: some View {
        BasketballCardView(bet: BetPresentationModel(home_result: 0, away_result: 0, home_odd: 0.0, away_odd: 0.0, tie_odd: 0.0, date: 0, sport: "soccer", home_team: TeamPresentationModel(name: "Barcelona", logo: ""), away_team: TeamPresentationModel(name: "Real Madrid", logo: "")))
    }
}
