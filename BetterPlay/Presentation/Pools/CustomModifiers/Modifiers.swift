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
