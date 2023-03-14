

import Foundation

extension RecoverPassEmailView{
    class ViewModel:ObservableObject{
        @Published var response: RecoverPassPresentationModel = .init()
        @Published var shouldShowCode: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func sendEmail(email: String, completion: @escaping (Bool) -> ()){
            let params: [String: String] = ["email": email]
            
            NetworkHelper.shared.requestProvider(endpoint: .recoverPasswordEmail, type: .POST, params: params) { data, response, error in
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
        
        func checkCorrectSecretCode(code: String, completion: @escaping (Bool) -> ()){
            
            if let userId = UserDefaults.standard.value(forKey: "idUserCodeEmail"){
                
                let params: [String: Any] = ["id": userId ,"code": code]


                NetworkHelper.shared.requestProvider(endpoint: .recoverPasswordCode, type: .POST, params: params) { data, response, error in
                    if let error = error {
                        self.onError(error: [error.localizedDescription])
                    } else if let data = data, let response = response as? HTTPURLResponse{
                        print(response.statusCode)
                        self.onSuccess(data: data) { showNewPass in
                            completion(showNewPass)
                        }
                    }
                }
            }
            
        }
        func onSuccess(data: Data, completion: (Bool) -> ()) {
            do{
                let data = try JSONDecoder().decode(RecoverPassResponseModel?.self, from: data)
                               
                self.response = RecoverPassPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? 0)
                
                print(self.response.code)
               
                if(self.response.code != 200){
                    self.onError(error: self.response.message)
                }else{
                    shouldShowNewPass = true
                    completion(shouldShowNewPass)
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
        @Published var response: RecoverPassPresentationModel = .init()
        @Published var shouldShowLogin: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func changePassword(password: String, completion: @escaping (Bool) -> ()){
            if let userId = UserDefaults.standard.value(forKey: "idUserCodeEmail"){
                
                let params: [String: Any] = ["id": userId ,"password": password]
                
                NetworkHelper.shared.requestProvider(endpoint: .recoverPassword, type: .POST, params: params) { data, response, error in
                    if let error = error {
                        self.onError(error: [error.localizedDescription])
                    } else if let data = data, let response = response as? HTTPURLResponse{
                        print(response.statusCode)
                        self.onSuccess(data: data) { showLogin in
                            completion(showLogin)
                        }
                    }
                }
            }
        }
        func onSuccess(data: Data, completion: @escaping (Bool) -> ()) {
            do{
                let data = try JSONDecoder().decode(RecoverPassResponseModel?.self, from: data)
                               
                self.response = RecoverPassPresentationModel(status: data?.status ?? "", code: data?.code ?? 0, message: data?.message ?? [""], data: data?.data ?? 0)
                
                print(self.response.code)
               
                if(self.response.code != 200){
                    self.onError(error: self.response.message)
                }else{
                    shouldShowLogin = true
                    completion(shouldShowLogin)
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
