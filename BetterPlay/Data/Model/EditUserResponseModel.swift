//
//  EditUserResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class EditUserResponseModel: BaseResponseModel {
    var data: UserResponseModel?
}


class BaseResponseModel: Decodable {
    var status: String?
    var code: Int?
    var message: [String]?
}
