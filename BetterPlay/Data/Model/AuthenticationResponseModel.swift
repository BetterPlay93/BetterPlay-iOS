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
