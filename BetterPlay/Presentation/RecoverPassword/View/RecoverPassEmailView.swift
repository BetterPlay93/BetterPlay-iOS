//
//  RecoverPassEmailView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RecoverPassEmailView: View {
    @State private var email = ""
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    
    var body: some View {
        ZStack() {
            VStack(spacing: 10) {
                logo
                VStack(spacing: 2){
                    emailTextField
                    checkEmailButton(email: email)
                    dots
                }
            }
            .frame(width: 327, height: 275)
            .background(Color("Background"))
            .cornerRadius(10)
        }
    }
    func checkEmailButton(email: String)-> some View{
        Button {
            viewmodel.sendEmail(email: email)
        } label: {
            Text("Continuar")
                .foregroundColor(.white)
                .frame(width: 89, height: 32)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }.background(
            NavigationLink(destination: RecoverPasswordCodeView(), isActive: $viewmodel.shouldShowCode) {
                EmptyView()
            }
        )
    }
    var emailTextField: some View {
        VStack(spacing:2){
            Text("Email")
                .frame(maxWidth: 234, alignment: .leading)
            TextField("",text: $email)
                .padding().frame(width: 234, height: 27)
                .background(Color(.white))
                .cornerRadius(10)
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
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("DarkGray"))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("Gray"))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("Gray"))
        }
    }
}

struct RecoverPassEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPassEmailView()
    }
}
