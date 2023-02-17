//
//  CustomBackButton.swift
//  BetterPlay
//
//  Created by Apps2T on 13/2/23.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var buttonColor : String
    
    var body: some View {

        HStack {
            VStack(alignment: .leading) {
               Button {
                   self.presentationMode.wrappedValue.dismiss()
               } label: {
                   Image(systemName: "arrow.backward")
                       .resizable()
                       .scaledToFit()
                       .foregroundColor(Color(buttonColor))
                       .frame(width: 30, height: 30)
               }
            }.padding(.leading, 20)
            .padding(.top, 40)
           Spacer()
       }
        
        
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(buttonColor: "DarkGray")
    }
}
