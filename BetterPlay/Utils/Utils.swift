//
//  Utils.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/4/23.
//

import Foundation
import SwiftUI

struct Utils {
    
    func getCoinsOfTheUser() -> Int{
        
        let coins = UserDefaults.standard.integer(forKey: "coins")
        return coins
    }
}

func teamText(name: String) -> some View {
    Text(name)
        .font(.system(size: 14))
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)
}

func teamTextSportCard(name: String, color: String) -> some View {
    Text(name)
        .foregroundColor(Color(color))
        .bold()
}

func dot(color: String) -> some View {
    Circle()
        .frame(width: 20, height: 20)
        .foregroundColor(Color(color))
}

var continueButton: some View {
    Text("Continuar")
        .modifier(CustomContinueButtonModifier())
}


