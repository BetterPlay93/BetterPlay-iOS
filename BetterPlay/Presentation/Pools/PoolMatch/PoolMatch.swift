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
                //Aquí se añadirá el día del evento
                Text("\(convertTimestampToDay(date:poolMatch.date))")
                    .font(.system(size: 12))
                    .bold()
                
                //Aquí se añadirá la fecha del evento
                Text("\(convertTimestampToHour(date:poolMatch.date))")
                    .font(.system(size: 12))
                    .bold()
            }
            
            selectResultTeams
            
        }.background(Color("LightGreen"))
        
    }
    
    var selectResultTeams: some View {
        HStack(spacing: 2) {
            ZStack {
                Button {
                    resultSelected = .home
                } label: {
                    Text("1")
                        .modifier(ResultPoolTextModifier())
                }
            }.frame(width: 26, height: 26)
                .background(resultSelected == .home ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    resultSelected = .tie
                } label: {
                    Text("X")
                        .modifier(ResultPoolTextModifier())
                }
                
            }.frame(width: 26, height: 26)
            .background(resultSelected == .tie ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    resultSelected = .away
                } label: {
                    Text("2")
                        .modifier(ResultPoolTextModifier())
                }
            }.frame(width: 26, height: 26)
            .background(resultSelected == .away ? Color("Green") : Color(.white))
            .padding(.trailing, 10)
        }
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
