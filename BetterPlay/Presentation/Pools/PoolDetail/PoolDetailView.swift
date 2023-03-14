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
            VStack(spacing: 0){
                VStack {
                    PoolNavBar(color: "Green")
                    
                    Rectangle().fill(Color("Green")).frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                }.background(Color("Background"))
                
                VStack {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(1...14, id: \.self) { i in
                                PoolMatch(id: i)
                            }
                            SpecialPoolMatch()
                        }
                    }
                }
                .padding(.top, 10)
                .background(Color("LightGreen"))
                .frame(maxHeight: UIScreen.main.bounds.height)
                
                Rectangle().fill(Color("Green")).frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                
                Button {
                    
                }label: {
                    Text("Continuar")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .background(Color("Green"))
                        .cornerRadius(10)
                }
                .padding(.top, 30)
            }
        }
    }
}

struct PoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoolDetailView()
    }
}
