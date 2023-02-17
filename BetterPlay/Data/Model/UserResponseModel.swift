//
//  UserModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class UserResponseModel: Decodable{
    
    var username: String?
    var email: String?
    var coins: Int?
    var followers: Int?
    var code: String?
    var photo: Data?
    
    init(username: String, email: String, coins: Int, followers: Int, code: String, photo: Data){
        self.username = username
        self.email = email
        self.coins = coins
        self.followers = followers
        self.code = code
        self.photo = photo
    }
}
