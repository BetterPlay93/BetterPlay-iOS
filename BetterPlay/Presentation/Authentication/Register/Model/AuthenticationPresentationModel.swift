//
//  AuthenticationPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

class AuthenticationPresentationModel {
    var status: String = ""
    var code: Int = 0
    var message: [String] = [""]
    var data: String = ""
    
    init(status: String, code: Int, message: [String], data: String){
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
    
    init(){}
}

class LoginPresentationModel: Decodable {
    var status: String = ""
    var code: Int = 0
    var message: [String] = [""]
    var data: UserWithTokenResponse = UserWithTokenResponse()
    
    init(status: String, code: Int, message: [String], data: UserWithTokenResponse){
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
    
    init(){}
}

