//
//  NotificationListResponseModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/2/23.
//

import Foundation


class NotificationListResponseModel: Decodable {
    var status: String?
    var code: Int?
    var message: String?
    var data: [NotificationResponseModel]?
    
}
