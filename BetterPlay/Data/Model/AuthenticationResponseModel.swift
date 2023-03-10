//
//  AuthenticationResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 20/2/23.
//

import Foundation

class AuthenticationResponseModel: Decodable {
    
    var status: String?
    var code: Int?
    var message: [String]
    var data: String?
    
}

class LoginResponseModel: Decodable {
    
    var status: String?
    var code: Int?
    var message: [String]?
    var data: UserWithTokenResponse?
    
}

class UserWithTokenResponse: Decodable {
    
    var token: String? = ""
    var user: UserResponseModel? = UserResponseModel()
    
    init(token: String, user: UserResponseModel) {
        self.token = token
        self.user = user
    }
    
    init(){
        
    }
    
}
