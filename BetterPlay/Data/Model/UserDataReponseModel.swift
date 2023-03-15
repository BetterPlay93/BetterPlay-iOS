//
//  UserDataReponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 14/3/23.
//

import Foundation

class UserDataResponseModel: Decodable{
    
    var percentage: [String:Int]? = ["":0]
    var streak: [String]? = [""]
    
    init(percentage: [String:Int], streak: [String]){
        self.percentage = percentage
        self.streak = streak
    }
    
    init(){}
}

