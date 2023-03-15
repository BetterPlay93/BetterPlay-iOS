//
//  ParticipateInBetView-ViewModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 20/2/23.
//

import Foundation

extension ParticipateInBetView {
    class ViewModel: ObservableObject {
        
        @Published var shouldNavigateToHome: Bool = false
        @Published var shouldShowAlert: Bool = false
        
        func participateInBet(eventId: Int, money: Int, winner: String) {
            
            let params: [String : Any] =  [
                "eventId": eventId + 1,
                "coins": money,
                "team_selected": winner
            ]
            
            var token = ""
            
            if let userToken = UserDefaults.standard.string(forKey: "token") as String?
            {
                token = userToken
            }
            
            NetworkHelper.shared.requestProvider(endpoint: .participateInBet, params: params, token: token) { data, response, error in
                if let error = error {
                    self.onError(error: [error.localizedDescription])
                } else if let data = data{
                    self.onSucess(data: data)
                }
            }
        }
        
        func onSucess(data: Data){
            do {
                let response = try JSONDecoder().decode(ParticipateInBetResponseModel?.self, from: data)
               
                if response?.code != 200 {
                    self.onError(error: response?.message ?? [""])
                }else{
                    shouldNavigateToHome = true
                }
                
            } catch {
                self.onError(error: [error.localizedDescription])
            }
        }
        
        func onError(error: [String]) {
            shouldShowAlert = true
            print(error)
        }
    }
}
