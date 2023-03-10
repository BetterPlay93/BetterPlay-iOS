//
//  PoolMatch.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct PoolMatch: View {
    @State var resultSelected: Result = .home
    var id: Int
    
    var body: some View {
        HStack (spacing: 10){
            //Aquí se escribirá la id del partido
            Text("\(id)")
                .font(.system(size: 20))
                .bold()
            
            //Aquí se escribirá el partido a realizar
            Text("FC. Barcelona - Real Madrid")
                .font(.system(size: 14))
                .bold()
            
            VStack {
                //Aquí se añadirá el día del evento
                Text("SAB")
                    .font(.system(size: 12))
                    .bold()
                
                //Aquí se añadirá la fecha del evento
                Text("17:00")
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
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
            }.frame(width: 26, height: 26)
                .background(resultSelected == .home ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    resultSelected = .tie
                } label: {
                    Text("X")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
                
            }.frame(width: 26, height: 26)
            .background(resultSelected == .tie ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    resultSelected = .away
                } label: {
                    Text("2")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
            }.frame(width: 26, height: 26)
            .background(resultSelected == .away ? Color("Green") : Color(.white))
            .padding(.trailing, 10)
        }
        
    }
}

struct PoolMatch_Previews: PreviewProvider {
    static var previews: some View {
        PoolMatch(id: 0).previewLayout(.sizeThatFits)
    }
}

enum Result: String {
    case home = "1"
    case tie = "X"
    case away = "2"
}
