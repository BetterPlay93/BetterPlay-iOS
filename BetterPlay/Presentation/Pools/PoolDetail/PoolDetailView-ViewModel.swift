//
//  PoolDetailView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import Foundation
import SwiftUI

extension PoolDetailView {
    class ViewModel: ObservableObject {
        @Published var poolMatches: [PoolMatchPresentationModel] = []
        
        func getPoolMatches(matches: String) {
            do {
                let data = Data(matches.utf8)
                let finalMatches = try JSONDecoder().decode([PoolMatchPresentationModel]?.self, from: data)
                self.poolMatches = finalMatches ?? []
                
                for i in 0...self.poolMatches.count - 1 {
                    self.poolMatches[i].id = i + 1
                }
            }catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
