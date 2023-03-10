//
//  DailyStreakView-ViewModel.swift
//  BetterPlay
//
//  Created by Apps2T on 20/2/23.
//

import Foundation
extension DailyStreakView{
    class ViewModel: ObservableObject {
        @Published var firstDay: Bool = false
        @Published var secondDay: Bool = false
        @Published var thirdDay: Bool = false
        @Published var forthDay: Bool = false
        @Published var fifthDay: Bool = false
        @Published var percentage: Int = 0
        //Streak recibida de la peticion tras el login
        func showStreak(streak: Int){
            switch streak{
            case 1:
                percentage = 0
                firstDay = true
                secondDay = false
                thirdDay = false
                forthDay = false
                fifthDay = false
            case 2:
                percentage = 25
                firstDay = true
                secondDay = true
                thirdDay = false
                forthDay = false
                fifthDay = false
            case 3:
                percentage = 50
                firstDay = true
                secondDay = true
                thirdDay = true
                forthDay = false
                fifthDay = false
            case 4:
                percentage = 75
                firstDay = true
                secondDay = true
                thirdDay = true
                forthDay = true
                fifthDay = false
            case 5:
                percentage = 100
                firstDay = true
                secondDay = true
                thirdDay = true
                forthDay = true
                fifthDay = true
            default:
                print("\(streak)")
                    
            }
        }
        
    }
}
