//
//  ParticipateInBetView.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 20/2/23.
//

import SwiftUI

struct ParticipateInBetView: View {
    
    var betData: ParticipateInBetModel
    //Se obtiene del user defaults, gracias a los valores del usuario
    var userCoins: Int
    @State var sliderValue: Double = 0
    @Binding var isShowing: Bool
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        if isShowing {
            withAnimation {
                ZStack(alignment: .bottom) {
                    Color.black
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isShowing = false
                        }
                    
                    VStack(alignment: .leading, spacing: 17){
                        Text(betData.team)
                            .foregroundColor(Color("Light\(betData.color)"))
                            .bold()
                            .font(.system(size: 20))
                        
                        quantityOfMoney
                        
                        quote
                        
                        revenueMoney
                        
                        slider
                      
                        participateButton
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height/2.9)
                    .padding(25)
                    .background(.white)
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }
        }
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
            
            Text("\(String(format: "%.2f", betData.odd))")
                .bold()
        }
    }
    
    var revenueMoney: some View {
        HStack {
            Text("Ganancia: ")
            
            Spacer()
            
            Text("+\(getRevenueMoney(money: sliderValue, quote: betData.odd))")
                .foregroundColor(Color("Light\(betData.color)"))
                .bold()
        }
    }
    
    var slider: some View {
        HStack {
            
            minSliderValueButton
            
            Slider(value: $sliderValue,
                in: 0...Double(userCoins),
                step: 100.0)
            .accentColor(Color("Light\(betData.color)"))
            
            maxSliderValueButton
        }
    }
    
    var participateButton: some View {
        HStack {
            Button {
                //El eventId se obtiene con la petición de todos los eventos y gracias al detalle y el winner se obtiene también del detalle
                viewModel.participateInBet(eventId: betData.betId, money: Int(sliderValue), winner: betData.result)
            }label: {
                Text("Jugar")
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(maxWidth: UIScreen.main.bounds.width/1.5)
            .padding(.vertical, 10)
            .background(Color("\(betData.color)"))
            .cornerRadius(10)
        }.frame(maxWidth: UIScreen.main.bounds.width)
        .padding(10)
    }
    
    var minSliderValueButton: some View {
        Button {
            sliderValue = 0.0
        }label: {
            Text("Min")
                .foregroundColor(Color("Light\(betData.color)"))
                .bold()
                .padding(.horizontal)
                .padding(.vertical, 5)
                .border(Color("Light\(betData.color)"), width: 1)
        }
    }
    
    var maxSliderValueButton: some View {
        Button {
            sliderValue = Double(userCoins)
        }label: {
            Text("All-in")
                .foregroundColor(Color("Light\(betData.color)"))
                .bold()
                .padding(.horizontal)
                .padding(.vertical, 5)
                .border(Color("Light\(betData.color)"), width: 1)
        }
    }
}

struct ParticipateInBetView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateInBetView(betData: ParticipateInBetModel(id: 1, team: "FC. Barcelona", odd: 1.0, betId: 1,sport: .soccer, color: "Green", result: "1"), userCoins: 4000, isShowing: .constant(true))
    }
}

func getRevenueMoney(money: Double, quote: Float) -> Int {
    let revenueMoney = Int(Float(money) * quote)
    return revenueMoney
}
