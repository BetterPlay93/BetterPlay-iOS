//
//  RecoverPassViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
extension RecoverPassEmailView{
    class ViewModel:ObservableObject{
        @Published var shouldShowCode: Bool = false
        @Published var shouldShowAlert: Bool = false
        func sendEmail(email: String){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/sendEmail"
            let params: [String: String] = ["email": email]
            
            NetworkHelper.shared.requestProvider(url: url, type: .POST, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse{
                    print(response.statusCode)
                    self.onSuccess(data: data, response: response)
                }
            }
        }
        func onSuccess(data: Data, response: HTTPURLResponse) {
            do{
                if response.statusCode != 200 {
                }else{
                    shouldShowCode = true
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
extension RecoverPasswordCodeView{
    class ViewModel:ObservableObject{
        @Published var shouldShowNewPass: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func checkCorrectSecretCode(code: String){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/checkCorrectSecretCode"
            let params: [String: String] = ["code": code]
            
            NetworkHelper.shared.requestProvider(url: url, type: .POST, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse{
                    print(response.statusCode)
                    self.onSuccess(data: data, response: response)
                }
            }
        }
        func onSuccess(data: Data, response: HTTPURLResponse) {
            do{
                if response.statusCode != 200 {
                }else{
                    shouldShowNewPass = true
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
extension NewPasswordView{
    class ViewModel:ObservableObject{
        @Published var shouldShowLogin: Bool = false
        @Published var shouldShowAlert: Bool = false
        func changePassword(password: String){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/changePassword"
            let params: [String: String] = ["password": password]
            
            NetworkHelper.shared.requestProvider(url: url, type: .POST, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse{
                    print(response.statusCode)
                    self.onSuccess(data: data, response: response)
                }
            }
        }
        func onSuccess(data: Data, response: HTTPURLResponse) {
            do{
                if response.statusCode != 200 {
                }else{
                    shouldShowLogin = true
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
