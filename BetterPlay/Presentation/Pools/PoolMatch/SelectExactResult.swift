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
            resultExactTeamSection(resultSelected: .Cero, selection: "0")
            resultExactTeamSection(resultSelected: .Uno, selection: "1")
            resultExactTeamSection(resultSelected: .Dos, selection: "2")
            resultExactTeamSection(resultSelected: .M, selection: "M")
        }
    }
    
    func resultExactTeamSection(resultSelected: ExactResultSelected, selection: String) -> some View {
        ZStack {
            Button {
                exactResultSelected = resultSelected
            } label: {
                Text(selection)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .bold()
            }
        }.frame(width: 26, height: 26)
        .background(exactResultSelected == resultSelected ? Color("Green") : Color(.white))
    }
    
}

struct SelectExactResult_Previews: PreviewProvider {
    static var previews: some View {
        SelectExactResult(exactResultSelected: .constant(.Cero))
    }
}

enum ExactResultSelected: String {
    case Cero = "0"
    case Uno = "1"
    case Dos = "2"
    case M = "3+"
}
