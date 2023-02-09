//
//  RecoverPasswordCodeView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RecoverPasswordCodeView: View {
    @State var secretCode = ""
           
    var body: some View {
       ZStack() {
           VStack(spacing: 10) {
               
               logo
               
               VStack(spacing: 2){
                   Text("Secret Code")
                       .frame(maxWidth: 234, alignment: .leading)
                   TextField("",text: $secretCode)
                       .padding().frame(width: 234, height: 27)
                       .background(Color(.white))
                       .cornerRadius(10)
                   
                   Button {
                       
                   } label: {
                       Text("Continuar")
                           .foregroundColor(.white)
                           .frame(width: 89, height: 32)
                           .background(Color("DarkGray"))
                           .cornerRadius(10)
                           .frame(maxWidth: .infinity, alignment: .trailing)
                           .padding()
                   }
                   
                   HStack {
                       Circle()
                           .frame(width: 20, height: 20)
                           .foregroundColor(Color("Gray"))
                       Circle()
                           .frame(width: 20, height: 20)
                           .foregroundColor(Color("DarkGray"))
                       Circle()
                           .frame(width: 20, height: 20)
                           .foregroundColor(Color("Gray"))
                   }
               }
           }
           .frame(width: 327, height: 275)
           .background(Color("Background"))
           .cornerRadius(10)
        }
    }
    
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 125, height: 80)
    }
}

struct RecoverPasswordCodeView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordCodeView()
    }
}
