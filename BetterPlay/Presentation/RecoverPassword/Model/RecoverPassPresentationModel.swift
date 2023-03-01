//
//  RecoverPassPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 28/2/23.
//

import Foundation


class RecoverPassPresentationModel: Decodable{
    var status: String = "KO"
    var code: Int = 404
    var message: [String] = []
    var data: Int = 0
    
    init(status: String, code: Int, message: [String], data: Int) {
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
    
    init(){}
}
