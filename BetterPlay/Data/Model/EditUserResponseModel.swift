//
//  EditUserResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class EditUserResponseModel: Decodable {
        
    var status: String?
    var code: Int?
    var message: [String]?
    var data: UserResponseModel?
    
}
