//
//  PoolResponseModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import Foundation

class PoolResponseModel: Decodable {
    
    var id: Int?
    var name: String?
    var matches: String?
    var finalDate: Int?
    var sport: String?
    
}
