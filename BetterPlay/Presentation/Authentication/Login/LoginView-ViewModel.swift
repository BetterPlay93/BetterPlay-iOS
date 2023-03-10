//
//  LoginView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

extension LoginView {
    class ViewModel: ObservableObject {
        @Published var shouldShowAlert: Bool = false
        @Published var shouldNavigateToHome: Bool = false
        @Published var response: LoginPresentationModel = LoginPresentationModel()
        
        func login(username: String, password: String){
            
            let url = "https://betterplay-backend-production.up.railway.app/api/users/login"
            
            let params: [String: String] = ["username":username, "password": password]
            
            NetworkHelper.shared.requestProvider(url: url, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data{
                    self.onSucess(data: data)
                }
            }
        }
        
        func onSucess(data: Data){
            do {
                let data = try JSONDecoder().decode(LoginResponseModel?.self, from: data)
               
                response = LoginPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? UserWithTokenResponse(token: "", user: UserResponseModel(username: "", email: "", coins: 0, followers: 0, code: "", photo: "")))
                
                if response.code != 200 {
                    self.onError(error: response.message)
                }else{
                    UserDefaults.standard.set(response.data.token, forKey: "token")
                    
                    let user = UserPresentationModel(dataModel: data)
                    if let data = try? JSONEncoder().encode(user) {
                        UserDefaults.standard.set(data, forKey: "user")
                    }
                    //Peticion de la racha
                    shouldNavigateToHome = true
                    print(response.data)

                }
                
            } catch {
                self.onError(error: [error.localizedDescription])
            }
        }
        
        func onError(error: [String]) {
            shouldNavigateToHome = true
            //shouldShowAlert = true
            print(error)
        }
        
    }
}
