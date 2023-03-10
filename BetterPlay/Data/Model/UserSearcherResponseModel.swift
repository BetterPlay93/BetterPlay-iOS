//
//  UserSearcherResponseModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/2/23.
//

import Foundation

class UserSearcherResponseModel: Decodable{
    
    var status: String?
    var code: Int?
    var message: [String]?
    var data: [UserResponseModel]?
        
}
