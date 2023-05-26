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
    var specialPoolMatch: PoolMatchPresentationModel
    
    var body: some View {
        HStack (spacing: 10){
            //Aquí se escribirá la id del partido
            Text("15")
                .font(.system(size: 20))
                .bold()
            
            //Aquí se escribirá el partido a realizar
            VStack (alignment: .leading) {
                teamText(name: specialPoolMatch.homeTeam.name)
                
                teamText(name: specialPoolMatch.awayTeam.name)
            }
            
            Spacer()
            
            VStack {
                timeText(dateValue: specialPoolMatch.date, dateFormat: "EEE")
                
                timeText(dateValue: specialPoolMatch.date, dateFormat: "HH:mm")
            }
            
            VStack {
                SelectExactResult(exactResultSelected: $homeExactResultSelected)
                SelectExactResult(exactResultSelected: $awayExactResultSelected)
            }
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(Color("LightGreen"))
    }
}



//struct SpecialPoolMatch_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialPoolMatch().previewLayout(.sizeThatFits)
//    }
//}


