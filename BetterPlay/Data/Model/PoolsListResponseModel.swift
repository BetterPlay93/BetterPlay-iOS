//
//  PoolsListResponseModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import Foundation

class PoolsListResponseModel: Decodable {
    
    var status: String?
    var code: Int?
    var message: [String]?
    var data: [PoolResponseModel?]?
    
}
