//
//  NotificationResponseModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/2/23.
//

import Foundation

class NotificationResponseModel: Decodable {
    
    let user_id: Int?
    let text: String?
    let type: String?
    
    init(user_id: Int, text: String, type: String) {
        self.user_id = user_id
        self.text = text
        self.type = type
    }
    
}

