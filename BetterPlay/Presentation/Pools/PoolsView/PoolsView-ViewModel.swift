//
//  PoolsView-ViewModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 10/3/23.
//

import Foundation

extension PoolsView {
    class ViewModel: ObservableObject {
        
        @Published var pools: [PoolPresentationModel] = []
        
        func filteredPools(by text: String, and sport: Sport) -> [PoolPresentationModel] {
            return pools.filter({
                guard !text.isEmpty else {
                    return $0.sport == sport || sport == .all
                }
                
                return ($0.name.contains(text) || $0.name.contains(text)) && ($0.sport == sport || sport == .all)
            })
        }
        
        func getAllPools() {
            if let token = UserDefaults.standard.string(forKey: "token") {
                
                NetworkHelper.shared.requestProvider(endpoint: .pools, type: .GET, token: token) { data, response, error in
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
                let poolsResponse = try JSONDecoder().decode(PoolsListResponseModel?.self, from: data)
                
                self.pools = poolsResponse?.data?.compactMap({ pool in
                    return PoolPresentationModel(id: pool?.id ?? 0, name: pool?.name ?? "", matches: pool?.matches ?? "", finalDate: pool?.finalDate ?? 0, sport: pool?.sport ?? "soccer")
                }) as? [PoolPresentationModel] ?? []
                
            } catch {
                self.onError(error: error.localizedDescription)
            }
        }
        
        func onError(error: String) {
            print(error)
        }
    }
}
