//
//  ParticipateInBetView.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 20/2/23.
//

import SwiftUI

struct ParticipateInBetView: View {
    
    var bet: BetPresentationModel
    var betMoney: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17){
            Text(bet.home)
                .foregroundColor(Color("LightGreen"))
                .bold()
                .font(.system(size: 20))
            
            HStack {
                Text("Cantidad: ")
                
                Spacer()
                
                Text("\(betMoney)")
                    .bold()
            }
            
            HStack {
                Text("Cuota: ")
                
                Spacer()
                
                Text("\(bet.home_odd)")
                    .bold()
            }
            
            
            HStack {
                Text("Ganancia: ")
                
                Spacer()
                
                Text("+1050")
                    .foregroundColor(Color("LightGreen"))
                    .bold()
            }
            
            HStack {
                Button {
                    
                }label: {
                    Text("Min")
                        .foregroundColor(Color("LightGreen"))
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .border(Color("LightGreen"), width: 1)
                    
                    CustomProgressView(progressColor: "LightGreen", progressBackgroundColor: "white", value: 10)
                    
                    Text("All-in")
                        .foregroundColor(Color("LightGreen"))
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .border(Color("LightGreen"), width: 1)
                }
            }
            
            HStack {
                Button {
                    
                }label: {
                    Text("Jugar")
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                .padding(.vertical, 10)
                .background(Color("Green"))
                .cornerRadius(10)
            }.frame(maxWidth: UIScreen.main.bounds.width)
                .padding()
            
        }
        .frame(width: 389, height: 311)
        .background(.white)
        .padding(.horizontal, 30)
    }
}

struct ParticipateInBetView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateInBetView(bet: BetPresentationModel(home: "FC.Barcelona", away: "Real Madrid", homeLogo: "https://media-1.api-sports.io/football/teams/529.png", awayLogo: "https://media-2.api-sports.io/football/teams/541.png", sport: "soccer", date: 1675962094, home_odd: 1.75, tie_odd: 2.00, away_odd: 2.15), betMoney: 1500).previewLayout(.sizeThatFits)
    }
}
