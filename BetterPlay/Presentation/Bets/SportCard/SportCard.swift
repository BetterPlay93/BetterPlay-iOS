//
//  SportCard.swift
//  BetterPlay
//
//  Created by Apps2T on 21/2/23.
//

import SwiftUI

struct SportCard: View {
    var bet: BetPresentationModel
    @State var color: String = "Green"
    
    var body: some View {
        HStack(spacing: 10){
            Image("\(bet.sport.rawValue)Card")
                .resizable()
                .scaledToFit()
                .frame(width: 107, height: 107)
               
            VStack(alignment: .leading, spacing: 8){
                players
                
                teams
                   
                dateAndPlay
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
                .foregroundColor(Color("Dark\(color)"))
                
            
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
                Image("Home\(bet.sport)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13, height: 15)
                
                Image("Away\(bet.sport)")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Dark\(color)"))
                    .frame(width: 17.6, height: 15)
                
            }
            
            VStack(alignment: .leading){
                Text("\(bet.home_team.name)")
                    .foregroundColor(Color(color))
                    .bold()
                
                Text("\(bet.away_team.name)")
                    .foregroundColor(Color(color))
                    .bold()
            }
        }
    }
    
    var dateAndPlay: some View {
        HStack {
            Image("Calendar\(bet.sport)")
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
                .foregroundColor(Color("Dark\(color)"))
                .frame(width: 18, height: 18)
               
            Text(convertTimestampToHour(date: bet.date))
                .font(.system(size: 13))
                .foregroundColor(Color("Gray"))
                .bold()
            
            NavigationLink(destination: BetDetailView(betDetail: BetDetailPresentationModel(bet: bet, color: "")), label: {
                Text("Jugar")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 67, height: 24)
                    .background(Color(color))
                    .cornerRadius(20)
            }).padding(.leading, 10)
        }.padding(.bottom, 5)
        .onAppear {
            if bet.sport == .soccer {
                color = "Green"
            }else if bet.sport == .basketball{
                color = "Orange"
            }else if bet.sport == .tennis {
                color = "Yellow"
            }
        }
    }
}

struct SportCard_Previews: PreviewProvider {
    static var previews: some View {
        SportCard(bet: BetPresentationModel(home_result: 0, away_result: 0, home_odd: 1.0, away_odd: 3.0, tie_odd: 1.5, date: 1676658884, sport: "Soccer", home_team: TeamPresentationModel(name: "Barcelona", logo: "https://media-1.api-sports.io/football/teams/529.png"), away_team: TeamPresentationModel(name: "Real Madrid", logo: "https://media-2.api-sports.io/football/teams/541.png")))
    }
}
