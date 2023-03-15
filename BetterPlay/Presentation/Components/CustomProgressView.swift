//
//  CustomProgressView.swift
//  BetterPlay
//
//  Created by Apps2T on 15/3/23.
//

import SwiftUI

struct CustomProgressView: View {
    var progressColor: String
    var progressBackgroundColor: String
    var value: Int
    
    var body: some View {
        ProgressView("", value: Float(value), total: 100)
             .tint(Color(progressColor))
             .background(Color(progressBackgroundColor))
             .scaleEffect(x: 1, y: 5, anchor: .bottom)
             .frame(height: 10)
             .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(progressColor: "Green", progressBackgroundColor: "Orange", value: 30)
    }
}
