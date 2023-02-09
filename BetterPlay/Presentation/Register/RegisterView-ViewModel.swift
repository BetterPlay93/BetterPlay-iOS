//
//  RegisterView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

extension RegisterView {
    class ViewModel: ObservableObject {
        @Published var response: AuthenticationPresentationModel = AuthenticationPresentationModel()
        @Published var shouldShowAlert: Bool = false
        @Published var showLogin: Bool = false
       
       
        func register(username: String, email:String, password: String){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/register"
           
            let params: [String:String] = ["username": username, "email": email, "password": password]
           
            NetworkHelper.shared.requestProvider(url: url, type: .PUT, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                    self.onSuccess(data: data)
                }
            }
        }
       
        func onSuccess(data: Data) {
            do {
                let data = try JSONDecoder().decode(AuthenticationResponseModel?.self, from: data)
               
                self.response = AuthenticationPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? "")
               
                if(self.response.code != 200){
                    self.onError(error: self.response.message)
                }else{
                    showLogin = true
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
