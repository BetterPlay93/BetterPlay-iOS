//
//  RecoverPassResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 28/2/23.
//

import Foundation

class RecoverPassResponseModel: Decodable{
    var status: String?
    var code: Int?
    var message: [String]
    var data: Int?
}
