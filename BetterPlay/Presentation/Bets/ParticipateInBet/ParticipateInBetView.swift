//
//  ParticipateInBetView.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 20/2/23.
//

import SwiftUI

struct ParticipateInBetView: View {
    
    var bet: BetPresentationModel
    //Se obtiene del user defaults, gracias a los valores del usuario
    var userCoins: Int
    @State var sliderValue: Double = 0
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17){
            Text(bet.home)
                .foregroundColor(Color("LightGreen"))
                .bold()
                .font(.system(size: 20))
            
            quantityOfMoney
            
            quote
            
            revenueMoney
            
            slider
          
            participateButton
            
        }
        .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/2.9)
        .background(.white)
    }
    
    var quantityOfMoney: some View {
        HStack {
            Text("Cantidad: ")
            
            Spacer()
            
            Text("\(String(format: "%.f",sliderValue))")
                .bold()
        }
    }
    
    var quote: some View {
        HStack {
            Text("Cuota: ")
            
            Spacer()
            
            Text("\(String(format: "%.2f", bet.home_odd))")
                .bold()
        }
    }
    
    var revenueMoney: some View {
        HStack {
            Text("Ganancia: ")
            
            Spacer()
            
            Text("\(getRevenueMoney(money: sliderValue, quote: bet.home_odd))")
                .foregroundColor(Color("LightGreen"))
                .bold()
        }
    }
    
    var slider: some View {
        HStack {
            
            minSliderValueButton
            
            Slider(value: $sliderValue,
                in: 0...Double(userCoins),
                step: 100.0)
            .accentColor(Color("LightGreen"))
            
            maxSliderValueButton
        }
    }
    
    var participateButton: some View {
        HStack {
            Button {
                //El eventId se obtiene con la petición de todos los eventos y gracias al detalle y el winner se obtiene también del detalle
                viewModel.participateInBet(eventId: 1, money: Int(sliderValue), winner: bet.home)
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
    
    var minSliderValueButton: some View {
        Button {
            sliderValue = 0.0
        }label: {
            Text("Min")
                .foregroundColor(Color("LightGreen"))
                .bold()
                .padding(.horizontal)
                .padding(.vertical, 5)
                .border(Color("LightGreen"), width: 1)
        }
    }
    
    var maxSliderValueButton: some View {
        Button {
            sliderValue = Double(userCoins)
        }label: {
            Text("All-in")
                .foregroundColor(Color("LightGreen"))
                .bold()
                .padding(.horizontal)
                .padding(.vertical, 5)
                .border(Color("LightGreen"), width: 1)
        }
    }
}

struct ParticipateInBetView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateInBetView(bet: BetPresentationModel(home: "FC.Barcelona", away: "Real Madrid", homeLogo: "https://media-1.api-sports.io/football/teams/529.png", awayLogo: "https://media-2.api-sports.io/football/teams/541.png", sport: "soccer", date: 1675962094, home_odd: 1.75, tie_odd: 2.00, away_odd: 2.15), userCoins: 4000)
    }
}

func getRevenueMoney(money: Double, quote: Float) -> Int {
    let revenueMoney = Int(Float(money) * quote)
    return revenueMoney
}
