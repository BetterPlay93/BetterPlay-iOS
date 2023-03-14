//
//  NetworkHelper.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

class NetworkHelper {
    
    //MARK: - Enum
    enum RequestType: String {
        case POST
        case GET
        case PUT
    }
    
    enum Endpoint: String {
        case login = "/users/login"
        case register = "/users/register"
        case recoverPasswordEmail = "/users/sendEmail"
        case recoverPasswordCode = "/users/checkCorrectSecretCode"
        case recoverPassword = "/users/changePassword"
        case bets = "/events/list"
        case participateInBet = "/events/participateInBet"
        case notifications = "/notifications/getNotificationsByUser"
        case pools = "/pools/list"
        case participateInPool = "/pools/participateInPool"
        case profileData = "/users/getUserData"
        case userSearcher = "/users/list"
        case editProfile = "/users/edit"
        case dailyStreak = "/users/updateStreak"
    }
    
    // MARK: - Constants
    static let shared = NetworkHelper()
    
    // MARK: - Private Methods
    private func requestApi(request: URLRequest, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
    
    //MARK: - Public Methods
    func requestProvider(endpoint: Endpoint, type: RequestType = .POST, params: [String: Any]? = nil, token: String? = nil, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        
        let url = URL(string: "https://betterplaybackend-production.up.railway.app/api\(endpoint.rawValue)")
                
        guard let urlNotNil = url else { return }
        
        var request = URLRequest(url: urlNotNil)
        
        request.httpMethod = type.rawValue
        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        if(token != nil) {
            request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        }
        
        if let dictionary = params {
            let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
            request.httpBody = data
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        requestApi(request: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
}

