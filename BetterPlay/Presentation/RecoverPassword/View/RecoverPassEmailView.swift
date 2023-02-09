//
//  RecoverPassEmailView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RecoverPassEmailView: View {
    @State private var email = ""
            
    var body: some View {
        ZStack() {
            VStack(spacing: 10) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 80)
                
                VStack(spacing: 2){
                    Text("Email")
                        .frame(maxWidth: 234, alignment: .leading)
                    TextField("",text: $email)
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
                            .foregroundColor(Color("DarkGray"))
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("Gray"))
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
}

struct RecoverPassEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPassEmailView()
    }
}
