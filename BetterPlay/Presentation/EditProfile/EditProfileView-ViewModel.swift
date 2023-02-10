//
//  EditProfileView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

extension EditProfileView {
    class ViewModel: ObservableObject {
        //UserDefaults.standard.string(forKey: "Key")
        @Published var goToProfile: Bool = false
        func edit(username: String, password: String) {
            
            let url = "https://betterplay-backend-production.up.railway.app/api/users/edit"
            let dictionary: [String: Any] = [
                "username" : username,
                "password" : password,
                
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        self.onSuccess()
                    } else {
                        self.onError(error: error?.localizedDescription ?? "Request Error")
                    }
                }
            }
        }
        //
        func onSuccess() {
            goToProfile = true
        }
        
        func onError(error: String) {
            print(error)
        }
        
    }
}
