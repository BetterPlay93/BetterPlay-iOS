//
//  ProfileView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

extension ProfileNavBar{
    class ViewModel: ObservableObject {
        
        @Published var user: UserPresentationModel = UserPresentationModel()
            
        func getUserData(){
            
            if let data = UserDefaults.standard.object(forKey: "user") as? Data {
                if let user = try? JSONDecoder().decode(UserPresentationModel.self, from: data) {
                    self.user = user
                }
            }
            
        }
    }
}
