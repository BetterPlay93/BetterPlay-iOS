//
//  PoolCard.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import SwiftUI

struct PoolCard: View {
    
    var sport: Sport
    @State var color: String = "Green"
    
    var body: some View {
        HStack(spacing: 10){
            Image("\(sport.rawValue)Card")
                .resizable()
                .scaledToFit()
                .frame(width: 107, height: 107)
               
            VStack(alignment: .leading, spacing: 8){
                
                participations
                
                Text("Jornada la Liga 1")
                    .font(.system(size: 18))
                    .foregroundColor(Color("\(color)"))
                    .bold()
                
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
        NavigationLink(destination: PoolDetailView().navigationBarHidden(true), label: {
            Text("Jugar")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
                .frame(width: 67, height: 24)
                .background(Color(color))
                .cornerRadius(20)
        })
        .padding(.trailing, 10)
        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .trailing)
    }
}

struct PoolCard_Previews: PreviewProvider {
    static var previews: some View {
        PoolCard(sport: .soccer).previewLayout(.sizeThatFits)
    }
}
