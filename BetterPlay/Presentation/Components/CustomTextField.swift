//
//  CustomTextField.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String

    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                    
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text).textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }else{
                    TextField(placeholderText, text: $text).textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
            }
                
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "envelope", placeholderText: "Email",isSecureField: false, text: .constant(""))
    }
}
