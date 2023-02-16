//
//  SoccerCardView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct SoccerCardView: View {
    var bet: BetPresentationModel
    
    var body: some View {
        HStack(spacing: 10){
            Image("SoccerCard")
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
                .foregroundColor(Color("DarkGreen"))
                
            
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
                Image("HomeSoccer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13, height: 15)
                
                Image("AwaySoccer")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("DarkGreen"))
                    .frame(width: 17.6, height: 15)
                
            }
            
            VStack(alignment: .leading){
                Text("\(bet.home_team.name)")
                    .foregroundColor(Color("Green"))
                    .bold()
                
                Text("\(bet.away_team.name)")
                    .foregroundColor(Color("Green"))
                    .bold()
            }
        }
    }
    
    var dateAndPlay: some View {
        HStack {
            Image("CalendarSoccer")
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
                .foregroundColor(Color("DarkGreen"))
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
                    .background(Color("Green"))
                    .cornerRadius(20)
            }.padding(.leading, 10)
        }.padding(.bottom, 5)
        
    }
}

struct SoccerCardView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerCardView(bet: BetPresentationModel(home_result: 0, away_result: 0, home_odd: 0.0, away_odd: 0.0, tie_odd: 0.0, date: 0, sport: "soccer", home_team: TeamPresentationModel(name: "Barcelona", logo: ""), away_team: TeamPresentationModel(name: "Real Madrid", logo: "")))
    }
}

func convertTimestampToDate(date: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(date))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yy"
    let strDate = dateFormatter.string(from: date)
    return strDate
}

func convertTimestampToHour(date: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(date))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let strDate = dateFormatter.string(from: date)
    return strDate
}
