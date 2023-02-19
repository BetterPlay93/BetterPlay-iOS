//
//  Searcher.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct Searcher: View {
    
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
      HStack {
          TextField("Buscar", text: $text)
              .padding(7)
              .padding(.horizontal, 25)
              .foregroundColor(.white)
              .background(Color("LightGray"))
              .cornerRadius(8)
              .padding(.horizontal, 10)
              .textInputAutocapitalization(.never)
              .onTapGesture {
                  self.isEditing = true
              }
      }.overlay(
           HStack {
               Image(systemName: "magnifyingglass")
                   .foregroundColor(.white)
                   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                   .padding(.leading, 18)
        
               if isEditing || text != ""{
                   Button(action: {
                       self.isEditing = false
                       self.text = ""
                   }) {
                       Image(systemName: "multiply.circle.fill")
                           .foregroundColor(.gray)
                           .padding(.trailing, 20)
                   }
               }
           }
       )
      .padding(.horizontal, 30)
    }
}

struct Searcher_Previews: PreviewProvider {
    static var previews: some View {
        Searcher(text: .constant(""))
    }
}
