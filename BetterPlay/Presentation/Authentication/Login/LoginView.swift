//
//  LoginView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct LoginView: View {
    @State var recoverEmail: Bool = false
    @State var recoverCode: Bool = false
    @State var recoverPass: Bool = false
    @State private var username = ""
    @State private var password = ""
    
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        ZStack {
            VStack {
                
                logo
                
                textFields
                
                forgotPassword
                
                signIn
                
                Spacer()
                
                navigateToRegister
                
                NavigationLink(destination: ContentView(), isActive: $viewModel.shouldNavigateToHome) {
                    EmptyView()
                }
            }
            .ignoresSafeArea()
            .background(Color("Background"))
            
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

    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 161.62)
            .padding(.top,100)
    }

    var textFields: some View {
        VStack(spacing: 40) {
            CustomTextField(imageName: "person", placeholderText: "Username", text: $username)
            
            CustomTextField(imageName: "lock",
                            placeholderText: "Password",
                            isSecureField: true,
                            text: $password)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }

    var forgotPassword: some View {
        HStack {
            Spacer()
            Button {
                withAnimation{
                    recoverEmail.toggle()
                }
            } label: {
                Text("Forgot Password?")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkGray"))
                    .padding(.top)
                    .padding(.trailing, 24)
            }
        }
    }

    var signIn: some View {
        Button {
            //Petición web
            viewModel.login(username: username, password: password)
        } label: {
            Text("Sign in")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .padding()
        }
        .alert("Error en el login", isPresented: $viewModel.shouldShowAlert, actions: {
            Button {

            } label: {
                Text("Ok")
            }
        }) {
            ForEach(viewModel.response.message, id:\.self){ message in
                Text("\(message)")
            }
        }
    }

    var navigateToRegister: some View {
        NavigationLink {
            RegisterView().navigationBarHidden(true)
        } label: {
            HStack {
                Text("Don't have an account?")
                    .font(.footnote)
                
                Text("Sign Up")
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
        .padding(.bottom, 32)
        .foregroundColor(Color("DarkGray"))
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
