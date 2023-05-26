//
//  Modifiers.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 29/3/23.
//

import Foundation
import SwiftUI

struct ResultPoolTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .heavy))
    }
}

struct CustomContinueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 89, height: 32)
            .background(Color("DarkGray"))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
    }
}
