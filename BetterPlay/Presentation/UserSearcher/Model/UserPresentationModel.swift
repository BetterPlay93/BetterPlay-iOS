//
//  UserPresentationModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/2/23.
//

import Foundation
class UserPresentationModel: Identifiable{
    let id = UUID()
    var username: String
    var email: String
    var coins: Int
    var followers: Int
    var code: String
    var photo: String
    
    init(username: String, email: String, coins: Int, followers: Int, code: String, photo: String){
        self.username = username
        self.email = email
        self.coins = coins
        self.followers = followers
        self.code = code
        self.photo = photo
    }
}
