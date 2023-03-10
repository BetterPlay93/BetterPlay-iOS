//
//  UserModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class UserResponseModel: Decodable{
    
    var username: String? = ""
    var email: String? = ""
    var coins: Int? = 0
    var followers: Int? = 0
    var code: String? = ""
    var photo: String? = ""
    
    init(username: String, email: String, coins: Int, followers: Int, code: String, photo: String){
        self.username = username
        self.email = email
        self.coins = coins
        self.followers = followers
        self.code = code
        self.photo = photo
    }
    
    init(){}
}
