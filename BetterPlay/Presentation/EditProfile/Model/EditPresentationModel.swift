//
//  EditPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class EditPresentationModel {
    var status: String = ""
    var code: Int =  0
    var message: [String] = [""]
    var data: UserResponseModel = UserResponseModel(username: "", email: "", coins: 0, followers: 0, code: "", photo: Data())
    
    init(status: String, code:Int, message: [String], data: UserResponseModel){
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
    init(){}
    
}
