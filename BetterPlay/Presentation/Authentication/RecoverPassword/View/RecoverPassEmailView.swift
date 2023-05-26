//
//  RecoverPassEmailView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RecoverPassEmailView: View {
    @Binding var show: Bool
    @Binding var showNext: Bool
    
    @State private var email = ""
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .center, content: {
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack(spacing: 25) {
                logo
                emailTextField
                checkEmailButton
                dots
            }.padding(.vertical, 25)
                .padding(.horizontal, 30)
                .background(Color("Background"))
                .cornerRadius(25)
                .frame(width: 327, height: 275)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }
    
    var checkEmailButton: some View{
        Button {
            viewmodel.sendEmail(email: email) { showCode in
                show.toggle()
                showNext.toggle()
            }
            
            
        } label: {
            continueButton
        }.alert("Error en la petición de recuperar contraseña", isPresented: $viewmodel.shouldShowAlert, actions: {
            Button {
                
            } label: {
                Text("Ok")
            }
        }) {
            ForEach(viewmodel.response.message, id:\.self){ message in
                Text("\(message)")
            }
        }
    }
    var emailTextField: some View {
        VStack(spacing:2){
            Text("Email")
                .frame(maxWidth: 234, alignment: .leading)
            TextField("",text: $email)
                .padding().frame(width: 234, height: 27)
                .background(Color(.white))
                .cornerRadius(10)
                .autocapitalization(.none)
        }
    }
    var logo: some View{
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 125, height: 80)
    }
    var dots: some View{
        HStack {
            dot(color: "DarkGray")
            dot(color: "Gray")
            dot(color: "Gray")
        }
    }
}

struct RecoverPassEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPassEmailView(show: .constant(true), showNext: .constant(true))
    }
}
