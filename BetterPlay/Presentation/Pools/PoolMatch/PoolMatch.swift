//
//  PoolMatch.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct PoolMatch: View {
    @State var resultSelected: Result = .home
    var poolMatch: PoolMatchPresentationModel
    
    var body: some View {
        HStack (spacing: 10){
            //Aquí se escribirá la id del partido
            Text("\(poolMatch.id ?? 0)")
                .font(.system(size: 20))
                .bold()
            
            //Aquí se escribirá el partido a realizar
            Text("\(poolMatch.homeTeam.name) - \(poolMatch.awayTeam.name)")
                .font(.system(size: 14))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                timeText(dateValue: poolMatch.date, dateFormat: "EEE")
                
                timeText(dateValue: poolMatch.date, dateFormat: "HH:mm")
            }
            
            selectResultTeams
            
        }.background(Color("LightGreen"))
        
    }
    
    var selectResultTeams: some View {
        HStack(spacing: 2) {
            resultTeamSection(result: .home, value: "1")
            
            resultTeamSection(result: .tie, value: "X")
            
            resultTeamSection(result: .away, value: "2")
                .padding(.trailing, 10)
        }
    }
    
    func resultTeamSection(result: Result, value: String) -> some View {
        ZStack {
            Button {
                resultSelected = result
            } label: {
                Text(value)
                    .modifier(ResultPoolTextModifier())
            }
        }.frame(width: 26, height: 26)
        .background(resultSelected == result ? Color("Green") : Color(.white))
    }
    
}

struct PoolMatch_Previews: PreviewProvider {
    static var previews: some View {
        PoolMatch(poolMatch: PoolMatchPresentationModel(id: 15, homeTeam: TeamPresentationModel(name: "FC.Barcelona", logo: ""), awayTeam: TeamPresentationModel(name: "Real Madrid", logo: ""), date: 0)).previewLayout(.sizeThatFits)
    }
}


enum Result: String {
    case home = "1"
    case tie = "X"
    case away = "2"
}

func timeText(dateValue: Int, dateFormat: String) -> some View {
    Text("\(convertTimestampToDate(date: dateValue, dateFormat: "HH:mm"))")
        .font(.system(size: 12))
        .bold()
}
