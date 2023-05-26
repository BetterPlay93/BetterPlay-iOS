//
//  PoolCard.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import SwiftUI

struct PoolCard: View {
    
    var pool: PoolPresentationModel
    var color: String
    
    var body: some View {
        HStack(spacing: 10){
            Image("\(pool.sport.rawValue)Card")
                .resizable()
                .scaledToFit()
                .frame(width: 107, height: 107)
               
            VStack(alignment: .leading, spacing: 8){
                
                participations
                
                Text("\(pool.name)")
                    .font(.system(size: 20))
                    .foregroundColor(Color("\(color)"))
                    .bold()
                    .padding(.leading, 10)
                
                navigateButton
            }
               
        }
        .frame(width: 359, height: 107)
        .background(.white)
        .cornerRadius(10)
    }
    
    var participations: some View {
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
    
    var navigateButton: some View {
        //Aquí navegaríamos al detalle de la quiniela
        NavigationLink(destination: PoolDetailView(pool: pool).navigationBarHidden(true), label: {
            Text("Jugar")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
                .frame(width: 67, height: 24)
                .background(Color(color))
                .cornerRadius(20)
        })
        .padding(.trailing, 10)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct PoolCard_Previews: PreviewProvider {
    static var previews: some View {
        PoolCard(pool:PoolPresentationModel(id: 0, name: "Jornada 1", matches: "", finalDate: 0, sport: "soccer"), color:"Green").previewLayout(.sizeThatFits)
    }
}
