//
//  TennisCardView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct TennisCardView: View {
    @State private var playerOne = "Rafa Nadal"
    @State private var playerTwo = "Novak Djokovic"
   
    var body: some View {
        HStack(spacing: 10){
            Image("TennisCard")
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
                .foregroundColor(Color("Yellow"))
                
            
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
                Image("HomeTennis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
                Image("HomeTennis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
            }
            
            VStack(alignment: .leading){
                Text("\(playerOne)")
                    .foregroundColor(Color("Yellow"))
                    .bold()
                
                Text("\(playerTwo)")
                    .foregroundColor(Color("Yellow"))
                    .bold()
            }
        }
    }
    
    var dateAndPlayButton: some View{
        HStack {
            Image("CalendarTennis")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
               
            Text("17-2-23")
                .font(.system(size: 13))
                .foregroundColor(Color("Gray"))
                .bold()
               
            Image(systemName: "clock")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("Yellow"))
                .frame(width: 18, height: 18)
               
            Text("20:00")
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
                    .background(Color("Yellow"))
                    .cornerRadius(20)
            }.padding(.leading, 10)
        }.padding(.bottom, 5)
    }
}

struct TennisCardView_Previews: PreviewProvider {
    static var previews: some View {
        TennisCardView()
    }
}
