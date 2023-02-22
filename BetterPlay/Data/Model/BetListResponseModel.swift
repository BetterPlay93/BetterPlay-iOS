//
//  BetListResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 22/2/23.
//

import Foundation

class BetListResponseModel: Decodable{
    
    var status: String?
    var code: Int?
    var message: String?
    var data: [BetResponseModel]?
    
}
