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
        
        func getUserImage(completion: @escaping (_ image: String?) -> ()) {
            let url = "https://betterplay-backend-production.up.railway.app/api/users/getCurrentUserPhoto"
            let logedToken =  "t3xGMM0zVtLJFPjSdI3pIF8sgQZpVMXB9xI6uGLn"
            
            NetworkHelper.shared.requestProvider(url: url, type: .GET, token: logedToken) { data, response, error in
                if let error = error {
                    self.onErrorImage(error: [error.localizedDescription])
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(response.statusCode)
                    self.onSuccessImage(data: data, response: response, completion: { image in
                        completion(image)
                    })
                }
            }
        }
        func onSuccessImage(data: Data, response: HTTPURLResponse, completion: (_ image: String?) -> ()) {
            do{
                let imageResponse = try JSONDecoder().decode(ImageResponseModel?.self, from: data)
                
                if response.statusCode == 200 {
                    completion(imageResponse?.data)
                }else{
                    self.onError(error: imageResponse?.message ?? [])
                }
            } catch {
                self.onError(error: [error.localizedDescription])
            }
        }
        
        func onErrorImage(error: [String]) {
            shouldShowAlert = true
            print(error)
        }
        
        func edit(username: String, password: String, photo: String	) {
            //Falta obtener el token del userdeafaults lo hacemos mientras natao a mano
            
            let url = "https://betterplay-backend-production.up.railway.app/api/users/edit"
            let logedToken =  "t3xGMM0zVtLJFPjSdI3pIF8sgQZpVMXB9xI6uGLn"
            let dictionary: [String: Any] = [
                "username" : username,
                "password" : password,
                "photo" : photo
            ]
            
            NetworkHelper.shared.requestProvider(url: url, type: .POST, params: dictionary, token: logedToken) { data, response, error in
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
