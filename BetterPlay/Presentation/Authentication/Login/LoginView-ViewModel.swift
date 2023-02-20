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
        @Published var response: AuthenticationPresentationModel = AuthenticationPresentationModel()
        
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
                let data = try JSONDecoder().decode(AuthenticationResponseModel?.self, from: data)
               
                response = AuthenticationPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""] , data: data?.data ?? "")
                
                if response.code != 200 {
                    self.onError(error: response.message)
                }else{
                    UserDefaults.standard.set(response.data, forKey: "token")
                    //Peticion de la racha
                    shouldNavigateToHome = true
                    print(response.data)

                }
                
            } catch {
                self.onError(error: [error.localizedDescription])
            }
        }
        
        func onError(error: [String]) {
            shouldShowAlert = true
            print(error)
        }
        
    }
}
