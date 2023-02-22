//
//  LoginTestView.swift
//  BetterPlay
//
//  Created by Apps2T on 22/2/23.
//

import SwiftUI

struct LoginTestView: View {
    @State var recoverEmail: Bool = false
    @State var recoverCode: Bool = false
    @State var recoverPass: Bool = false
    var body: some View {
        ZStack(){
            
            Button{
                withAnimation{
                    recoverEmail.toggle()
                }
                
            }label: {
                Text("Recuperar contraseña")
            }
    
            
            if recoverEmail {

                RecoverPassEmailView(show: $recoverEmail, showNext: $recoverCode)
            }
            if recoverCode{
                RecoverPasswordCodeView(show: $recoverCode, showNext: $recoverPass)
            }
            if recoverPass{
                NewPasswordView(show: $recoverPass)
            }
        }
        
    }
}

struct LoginTestView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTestView()
    }
}
