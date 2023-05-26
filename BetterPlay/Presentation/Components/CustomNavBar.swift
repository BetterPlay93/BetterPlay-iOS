//
//  CustomNavBar.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct CustomNavBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var color: String
    
    var body: some View {
        HStack {
            btnBack
            Spacer()
            UserCoins(coins: "\(Utils().getCoinsOfTheUser())")
        }
        .padding()
        .frame(height: 60)
        .background(Color("Background"))
        .padding(.top, 40)
    }
    
    var btnBack: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left") // set image here
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(color))
            }
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(color: "Green")
    }
}


