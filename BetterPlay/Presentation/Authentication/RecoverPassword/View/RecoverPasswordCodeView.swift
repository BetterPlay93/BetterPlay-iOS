//
//  RecoverPasswordCodeView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RecoverPasswordCodeView: View {
    @Binding var show: Bool
    @Binding var showNext: Bool
    
    @State var secretCode = ""
    @ObservedObject var viewmodel : ViewModel = ViewModel()
           
    var body: some View {
        ZStack(alignment: .center, content: {
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack(spacing: 25) {
                logo
                secretCodeTexts
                continueButton
                dots
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(Color("Background"))
            .cornerRadius(25)
            .frame(width: 327, height: 275)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    var continueButton: some View{
        Button {
            viewmodel.checkCorrectSecretCode(code: secretCode) { showNewPass in
                show.toggle()
                showNext = showNewPass
            }
        } label: {
            Text("Continuar")
                .foregroundColor(.white)
                .frame(width: 89, height: 32)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }.alert("Error al comprobar el código secreto", isPresented: $viewmodel.shouldShowAlert, actions: {
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
    var dots: some View{
        HStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("Gray"))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("DarkGray"))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("Gray"))
        }
    }
    var secretCodeTexts: some View {
        VStack(spacing: 2){
            Text("Secret Code")
                .frame(maxWidth: 234, alignment: .leading)
            TextField("",text: $secretCode)
                .padding().frame(width: 234, height: 27)
                .background(Color(.white))
                .cornerRadius(10)
        }
    }
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 125, height: 80)
    }
}

struct RecoverPasswordCodeView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordCodeView(show: .constant(true), showNext: .constant(true))
    }
}
