//
//  EditProfileView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

extension EditProfileView {
    class ViewModel: ObservableObject {
        @Published var goToProfile: Bool = false
        @Published var shouldShowAlert: Bool = false
        @Published var userProfile: EditPresentationModel = .init()
        
        func putAndGetOfFirebaseImage(username: String, password: String, photo: UIImage) {
             
            let storage = Storage.storage().reference()
            storage.child("userImages/\(username)").putData(photo.jpegData(compressionQuality: 0.5) ?? Data(), metadata: nil) { metadata, error in
             
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            
                print("success")
                
                let imageRef = storage.child("userImages/\(username)")

                // Fetch the download URL
                imageRef.downloadURL { url, error in
                  if let error = error {
                      print(error.localizedDescription)
                      return
                  } else {
                      self.edit(username: username, password: password, photo: url?.absoluteString ?? "")
                  }
                }
            }
        }
        
        
        func edit(username: String, password: String, photo: String	) {
            //Falta obtener el token del userdeafaults lo hacemos mientras natao a mano
            
            let url = "https://betterplay-backend-production.up.railway.app/api/users/edit"
            let logedToken =  "6jTcbJDLD048zQ8UW0pqAWtKfelevHRs0ZzW0OLt"
            let dictionary: [String: Any] = [
                "username" : username,
                "password" : password,
                "photo" : photo
            ]
            
            NetworkHelper.shared.requestProvider(endpoint: .editProfile, type: .POST, params: dictionary, token: logedToken) { data, response, error in
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
