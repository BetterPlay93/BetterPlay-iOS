//
//  SpecialPoolMatch.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct SpecialPoolMatch: View {
    
    @State var homeExactResultSelected: ExactResultSelected = .Cero
    @State var awayExactResultSelected: ExactResultSelected = .Cero
    
    var body: some View {
        HStack (spacing: 10){
            //Aquí se escribirá la id del partido
            Text("15")
                .font(.system(size: 20))
                .bold()
                .padding(.leading, 12)
            
            //Aquí se escribirá el partido a realizar
            VStack (alignment: .leading) {
                Text("FC. Barcelona")
                    .font(.system(size: 14))
                    .bold()
                
                Text("Real Madrid")
                    .font(.system(size: 14))
                    .bold()
            }
            
            Spacer()
            
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
            
            VStack {
                SelectExactResult(exactResultSelected: $homeExactResultSelected)
                SelectExactResult(exactResultSelected: $awayExactResultSelected)
            }.padding(.trailing, 10)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(Color("LightGreen"))
    }
}

struct SpecialPoolMatch_Previews: PreviewProvider {
    static var previews: some View {
        SpecialPoolMatch().previewLayout(.sizeThatFits)
    }
}

enum ExactResultSelected: String {
    case Cero = "0"
    case Uno = "1"
    case Dos = "2"
    case M = "3+"
}
