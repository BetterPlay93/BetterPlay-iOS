//
//  UserCoins.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct UserCoins: View {
    var coins: String
       
   var body: some View {
       HStack {
           Text("\(coins)")
               .font(.system(size: 20))
               .bold()
           Image("Coins")
               .resizable()
               .scaledToFit()
               .frame(width: 30, height: 30, alignment: .leading)
       }
   }
}

struct UserCoins_Previews: PreviewProvider {
    static var previews: some View {
        UserCoins()
    }
}
