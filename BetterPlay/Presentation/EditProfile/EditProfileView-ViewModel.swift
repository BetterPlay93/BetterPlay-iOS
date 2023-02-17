//
//  EditProfileView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
import UIKit

extension EditProfileView {
    class ViewModel: ObservableObject {
        @Published var goToProfile: Bool = false
        @Published var shouldShowAlert: Bool = false
        @Published var userProfile: EditPresentationModel = .init()
        
        func edit(username: String, password: String, photo: Data	) {
            //Falta obtener el token del userdeafaults lo hacemos mientras natao a mano
            
            let url = "https://betterplay-backend-production.up.railway.app/api/users/edit"
            let logedToken =  "t3xGMM0zVtLJFPjSdI3pIF8sgQZpVMXB9xI6uGLn"
            let dictionary: [String: Any] = [
                "username" : username,
                "password" : password,
                "photo" : photo
            ]
            
            NetworkHelper.shared.requestProvider(url: url, token: logedToken, type: .POST, params: dictionary) { data, response, error in
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
                let data = try JSONDecoder().decode(EditUserResponseModel?.self, from: data)
                userProfile = .init(dataModel: data)
                
                if response.statusCode != 200 {
                    self.onError(error: data?.message ?? [])
                }else{
                    //UserDefaults.standard.set(response.data, forKey: "token")
                    goToProfile = true
                }
            } catch {
                self.onError(error: [error.localizedDescription])
            }
            
            goToProfile = true
        }
        
        func onError(error: [String]) {
            shouldShowAlert = true
            print(error)
        }
        
    }
}
