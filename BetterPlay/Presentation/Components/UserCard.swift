//
//  UserCard.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct UserCard: View {
    
    var body: some View {
        HStack {
            Image("Women")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
                .padding(.leading)
            
            Text("Saraaa_cd")
                .foregroundColor(.black)
                .bold()
                .padding(.horizontal, 10)
            
            Spacer()
            
            Button {
                
            }label: {
                Text("Perfil")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black)
                    .cornerRadius(20)
            }.padding(.trailing)
        }
        .frame(width: 359, height: 70)
        .background(.white)
        .cornerRadius(20)
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard().previewLayout(.sizeThatFits)
    }
}
