//
//  ProfileView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
import UIKit

extension ProfileView {
    class ViewModel: ObservableObject {
        @Published var userData: UserDataPresentationModel = UserDataPresentationModel()
        func getUserData(completion: @escaping (UserDataPresentationModel) -> ()) {
            if let token = UserDefaults.standard.string(forKey: "token") {
                
                NetworkHelper.shared.requestProvider(endpoint: .profileData, type: .GET, token: token) { data, response, error in
                    if let error = error {
                        self.onError(error: error.localizedDescription)
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        self.onSuccess(data: data) { userData in
                            completion(userData)
                        }
                    }
                   
                }
            }
        }
                
        func onSuccess(data: Data, completion: @escaping (UserDataPresentationModel) -> ()) {
            do {
                let userDataResponse = try JSONDecoder().decode(UserDataResponseModel?.self, from: data)
                
                completion(UserDataPresentationModel(percentage: userDataResponse?.percentage ?? [:],streak: userDataResponse?.streak ?? []))
                
            } catch {
                self.onError(error: error.localizedDescription)
            }
        }
                
        func onError(error: String) {
            print(error)
        }
    }
}
