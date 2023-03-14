//
//  SelectExactResult.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import SwiftUI

struct SelectExactResult: View {
    @Binding var exactResultSelected: ExactResultSelected
    
    var body: some View {
        HStack(spacing: 2) {
            ZStack {
                Button {
                    exactResultSelected = .Cero
                } label: {
                    Text("0")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
            }.frame(width: 26, height: 26)
                .background(exactResultSelected == .Cero ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    exactResultSelected = .Uno
                } label: {
                    Text("1")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
                
            }.frame(width: 26, height: 26)
            .background(exactResultSelected == .Uno ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    exactResultSelected = .Dos
                } label: {
                    Text("2")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
                
            }.frame(width: 26, height: 26)
            .background(exactResultSelected == .Dos ? Color("Green") : Color(.white))
            
            ZStack {
                Button {
                    exactResultSelected = .M
                } label: {
                    Text("M")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
            }.frame(width: 26, height: 26)
            .background(exactResultSelected == .M ? Color("Green") : Color(.white))
            .padding(.trailing, 10)
        }
    }
}

struct SelectExactResult_Previews: PreviewProvider {
    static var previews: some View {
        SelectExactResult(exactResultSelected: .constant(.Cero))
    }
}
