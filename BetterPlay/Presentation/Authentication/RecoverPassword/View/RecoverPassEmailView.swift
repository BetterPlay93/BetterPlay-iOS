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
                HStack(alignment: .center, spacing: 0){
                    logo.padding(.trailing, 40)
                    
                    Button {
                        withAnimation {
                            show.toggle()
                        }
                    }label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                    }.padding(.bottom, 50)
                }.frame(maxWidth: .infinity, alignment: .trailing)
                
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
            viewmodel.sendEmail(email: email)
            if viewmodel.shouldShowCode {
                show.toggle()
                showNext.toggle()
            }
            
        } label: {
            Text("Continuar")
                .foregroundColor(.white)
                .frame(width: 89, height: 32)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
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
        RecoverPassEmailView(show: .constant(true), showNext: .constant(true))
    }
}
