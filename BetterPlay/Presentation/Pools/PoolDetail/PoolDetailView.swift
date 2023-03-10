//
//  PoolDetailView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct PoolDetailView: View {
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    PoolNavBar(color: "Green")
                    
                    Rectangle().fill(Color("Green")).frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                    Spacer()
                }.background(Color("Background"))
                
                VStack {
                    ScrollView {
                        LazyVStack {
                            
                        }
                    }
                }
                .padding(.top, 20)
                .background(Color("LightGreen"))
            }
        }
        
    }
}

struct PoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoolDetailView()
    }
}
