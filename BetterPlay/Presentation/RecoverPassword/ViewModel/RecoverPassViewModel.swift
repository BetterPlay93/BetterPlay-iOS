//
//  RecoverPassViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
extension RecoverPassEmailView{
    class ViewModel:ObservableObject{
        @Published var response: RecoverPassPresentationModel = .init()
        @Published var shouldShowCode: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func sendEmail(email: String, completion: @escaping (Bool) -> ()){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/sendEmail"
            let params: [String: String] = ["email": email]
            
            NetworkHelper.shared.requestProvider(url: url, type: .POST, params: params) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse{
                    print(response.statusCode)
                    self.onSuccess(data: data) { showCode in
                        completion(showCode)
                    }
                }
            }
        }
        
        func onSuccess(data: Data, completion: (Bool) -> ()) {
            do{
                let data = try JSONDecoder().decode(RecoverPassResponseModel?.self, from: data)
                               
                self.response = RecoverPassPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? 1)
                
                print(self.response)
               
                if(self.response.code != 200){
                    self.onError(error: self.response.message)
                }else{
                    UserDefaults.standard.set(response.data, forKey: "idUserCodeEmail")
                    shouldShowCode = true
                    completion(shouldShowCode)
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
        
        @Published var response: RecoverPassPresentationModel = .init()
        @Published var shouldShowNewPass: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func checkCorrectSecretCode(code: String){
            let url = "https://betterplay-backend-production.up.railway.app/api/users/checkCorrectSecretCode"
            //if let userId = UserDefaults.standard.integer(forKey: "idUserCodeEmail") {
                //let params: [String: Any] = ["id": userId ,"code": code]
                
                
                NetworkHelper.shared.requestProvider(url: url, type: .POST, params: params) { data, response, error in
                    if let error = error {
                        self.onError(error: [error.localizedDescription])
                    } else if let data = data, let response = response as? HTTPURLResponse{
                        print(response.statusCode)
                        self.onSuccess(data: data)
                    }
                }
            //}
            
        }
        func onSuccess(data: Data) {
            do{
                let data = try JSONDecoder().decode(RecoverPassResponseModel?.self, from: data)
                               
                self.response = RecoverPassPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? 0)
                
                print(self.response)
               
                if(self.response.code != 200){
                    self.onError(error: self.response.message)
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
