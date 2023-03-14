//
//  UserSearcherView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import Foundation

extension UserSearcherView {
    class ViewModel: ObservableObject {
        
        @Published var users: [UserPresentationModel] = []
        
        func getAllUsers() {
            if let token = UserDefaults.standard.string(forKey: "token") {
                NetworkHelper.shared.requestProvider(endpoint: .userSearcher, type: .GET, token: token) { data, response, error in
                    if let error = error {
                        self.onError(error: error.localizedDescription)
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        self.onSuccess(data: data)
                    }
                }
            }
        }
        
        func onSuccess(data: Data) {
            do {
                let usersResponse = try JSONDecoder().decode(UserSearcherResponseModel?.self, from: data)
                
                self.users = usersResponse?.data?.compactMap({ user in
                    return UserPresentationModel(username: user.username ?? "", email: user.email ?? "", coins: user.coins ?? 0, followers: user.followers ?? 0, code: user.code ?? "", photo: user.photo ?? "")
                }) as? [UserPresentationModel] ?? []
                
            } catch {
                self.onError(error: error.localizedDescription)
            }
        }
        
        func onError(error: String) {
            print(error)
        }
    }
}
