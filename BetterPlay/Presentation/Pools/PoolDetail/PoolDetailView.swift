//
//  PoolDetailView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct PoolDetailView: View {
    var pool: PoolPresentationModel
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                VStack {
                    PoolNavBar(color: "Green", title: pool.name)
                    
                    Rectangle().fill(Color("Green")).frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                }.background(Color("Background"))
                
                VStack {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(Array(viewModel.poolMatches.enumerated()), id: \.offset) { index, pool in
                                if (viewModel.poolMatches.count - 1) == index {
                                    SpecialPoolMatch(specialPoolMatch: pool)
                                } else {
                                    PoolMatch(poolMatch: pool)
                                }
                            }
                        }.padding(.leading, 10)
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
        .onAppear {
            viewModel.getPoolMatches(matches: pool.matches)
        }
    }
}

struct PoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoolDetailView(pool: PoolPresentationModel(id: 1, name: "Jornada 1", matches: "", finalDate: 0, sport: "soccer"))
    }
}
