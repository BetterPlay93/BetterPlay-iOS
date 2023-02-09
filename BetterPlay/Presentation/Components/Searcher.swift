//
//  Searcher.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct Searcher: View {
    @State private var text: String = ""
    
    var body: some View {
       ZStack {
           HStack(alignment: .center, spacing: 10){
               Image(systemName: "magnifyingglass")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 15.63, height: 15.78)
                   .foregroundColor(.white)
               
               TextField("Buscar", text: $text)
                   .foregroundColor(Color.white)
           }
           .frame(maxWidth: .infinity, alignment: .leading)
           .padding()
       }
       .frame(width: 334, height: 35)
       .background(Color("LightGray"))
       .cornerRadius(10)
   }
}

struct Searcher_Previews: PreviewProvider {
    static var previews: some View {
        Searcher()
    }
}
