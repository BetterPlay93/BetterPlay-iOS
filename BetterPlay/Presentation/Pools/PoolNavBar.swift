//
//  PoolNavBar.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct PoolNavBar: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var color: String
    
    var body: some View {
        
        HStack {
            btnBack
            
            Text("La Liga - Jornada 1")
                .font(.system(size: 25))
                .foregroundColor(.black)
                .bold()
                .padding(.leading, 20)
            
            Spacer()
        }.padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color("Background"))
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

struct PoolNavBar_Previews: PreviewProvider {
    static var previews: some View {
        PoolNavBar(color: "Green")
    }
}
