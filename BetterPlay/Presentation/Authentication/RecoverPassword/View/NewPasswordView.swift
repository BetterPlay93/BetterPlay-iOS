//
//  NewPasswordView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct NewPasswordView: View {
    @State private var password = ""
    @State private var repeatPassword = ""
       
    var body: some View {
       ZStack() {
           VStack(spacing: 10) {
               
               logo()
               
               VStack(spacing: 2){
                   Text("Password")
                       .frame(maxWidth: 234, alignment: .leading)
                   TextField("",text: $password)
                       .padding().frame(width: 234, height: 27)
                       .background(Color(.white))
                       .cornerRadius(10)
                   
                   Text("Repeat Password")
                       .frame(maxWidth: 234, alignment: .leading)
                   TextField("",text: $repeatPassword)
                       .padding().frame(width: 234, height: 27)
                       .background(Color(.white))
                       .cornerRadius(10)
                   
                   confirmButton
                   
                   pages
               }
           }
           .frame(width: 327, height: 330)
           .background(Color("Background"))
           .cornerRadius(10)
       }
    }

    func logo() -> some View {
       Image("Logo")
           .resizable()
           .scaledToFit()
           .frame(width: 125, height: 80)
    }

    var confirmButton: some View{
       Button {
           //Petición web
       } label: {
           Text("Confirmar")
               .foregroundColor(.white)
               .frame(width: 89, height: 32)
               .background(Color("DarkGray"))
               .cornerRadius(10)
               .frame(maxWidth: .infinity, alignment: .trailing)
               .padding()
       }
    }

    var pages: some View {
       HStack {
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("Gray"))
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("Gray"))
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("DarkGray"))
       }
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
