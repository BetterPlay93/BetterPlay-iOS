//
//  RegisterView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var showPasswordAlert: Bool = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        NavigationView{
            VStack {
                
                logo
                
                textFields
                
                signUp
                
                Spacer()
                
                navigateToLogin
            }
            .ignoresSafeArea()
            .background(Color("Background"))
            .alert("Error en el registro", isPresented: $viewModel.shouldShowAlert, actions: {
                Button {
                    
                } label: {
                    Text("Ok")
                }
            }) {
                ForEach(viewModel.response.message, id:\.self){ message in
                    Text("\(message)")
                }
            }
            .alert("Error en el registro", isPresented: $showPasswordAlert, actions: {
                Button {
                    
                } label: {
                    Text("Ok")
                }
            }) {
                Text("Las contraseñas no son iguales")
            }
            .onReceive(viewModel.$showLogin) { newValue in
                if newValue {
                    presentationMode.wrappedValue.dismiss()
                }
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
            
            CustomTextField(imageName: "envelope", placeholderText: "Email", text: $email)
            
            CustomTextField(imageName: "lock",
                            placeholderText: "Password",
                            isSecureField: true,
                            text: $password)
            
            CustomTextField(imageName: "lock",
                            placeholderText: "Repeat Password",
                            isSecureField: true,
                            text: $repeatPassword)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }


    var signUp: some View {
        Button {
            //Petición web
            if password == repeatPassword {
                viewModel.register(username: username, email: email, password: password)
                
            }else{
                showPasswordAlert.toggle()
            }
        } label: {
            Text("Sign Up")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .padding(40)
        }
    }

    var navigateToLogin: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Text("You have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
        .padding(.bottom, 32)
        .foregroundColor(Color("DarkGray"))
        .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
