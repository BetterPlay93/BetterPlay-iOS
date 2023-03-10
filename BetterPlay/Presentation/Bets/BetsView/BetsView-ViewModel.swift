//
//  BetsView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation
import UIKit

extension BetsView {
    class ViewModel: ObservableObject {
        
        @Published var bets: [BetPresentationModel] = []
        
        
        func filteredBets(by text: String, and sport: Sport) -> [BetPresentationModel] {
            return bets.filter({
                guard !text.isEmpty else {
                    return $0.sport == sport || sport == .all
                }
                
                return ($0.home_team.name.contains(text) || $0.away_team.name.contains(text)) && ($0.sport == sport || sport == .all)
            })
        }
        
        func getAllBets() {
            //Usamos un token predeterminado hasta que estén hechas todas las conexiones que ya usaremos el token del user defaults
            if let token = UserDefaults.standard.string(forKey: "token") {
                let url = "https://betterplay-backend-production.up.railway.app/api/events/list"
                
                NetworkHelper.shared.requestProvider(url: url, type: .GET, token: token) { data, response, error in
                    if let error = error {
                        self.onError(error: error.localizedDescription)
                    } else if let data = data, let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        self.onSuccess(data: data)
                    }
                   
                }
            }
            
            
        }
        
        func onSuccess(data: Data) {
            do {
                let betsResponse = try JSONDecoder().decode(BetListResponseModel?.self, from: data)
                
                self.bets = betsResponse?.data?.compactMap({ bet in
                    return BetPresentationModel(home_result: bet?.home_result ?? 0, away_result: bet?.away_result ?? 0, home_odd: bet?.home_odd ?? 0.0, away_odd: bet?.away_odd ?? 0.0, tie_odd: bet?.tie_odd ?? 0.0, date: bet?.date ?? 0, sport: bet?.sport ?? "", home_team: TeamPresentationModel(name: bet?.home_team.name ?? "", logo: bet?.home_team.logo ?? ""), away_team: TeamPresentationModel(name: bet?.away_team.name ?? "" , logo: bet?.away_team.logo ?? ""))
                }) as? [BetPresentationModel] ?? []
                
            } catch {
                self.onError(error: error.localizedDescription)
            }
        }
        
        func onError(error: String) {
            print(error)
        }
    }
}
