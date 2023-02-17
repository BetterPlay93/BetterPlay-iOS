//
//  DailyStreakView.swift
//  BetterPlay
//
//  Created by Apps2T on 17/2/23.
//

import SwiftUI

struct DailyStreakView: View {
    @State var firstDay: Bool = true
    @State var secondDay: Bool = false
    @State var thirdDay: Bool = false
    @State var forthDay: Bool = false
    @State var fifthDay: Bool = false
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: .infinity, height: 230)
                .cornerRadius(20)
            VStack(spacing: 20){
                HStack(spacing: 25){
                    customRectangle(isCompleted: firstDay, coins: 500)
                    customRectangle(isCompleted: secondDay, coins: 1000)
                    customRectangle(isCompleted: thirdDay, coins: 1500)
                    customRectangle(isCompleted: forthDay, coins: 2000)
                    customRectangle(isCompleted: fifthDay, coins: 3000)
                }.frame(alignment: .top)
                ZStack(alignment: .leading){
                    CustomProgressView(progressColor: "DarkGray",progressBackgroundColor: "White", value:25)
                        .frame(width: 310)
                    HStack(spacing: 55){
                        Circle()
                            .foregroundColor(Color("DarkGray"))
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(Color("DarkGray"))
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(Color("DarkGray"))
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(Color("DarkGray"))
                            .frame(width: 20, height: 20)
                        Circle()
                            .foregroundColor(Color("DarkGray"))
                            .frame(width: 20, height: 20)

                    }
                }
                dayTexts
            }
            
        }
    }
    func customRectangle(isCompleted: Bool, coins: Int)-> some View{
        ZStack(){
            if(isCompleted){
                Rectangle()
                    .foregroundColor(Color("Gray"))
                    .frame(width: 50, height: 50)
                    .cornerRadius(20)
                VStack(spacing: 0){
                    Image("Coins")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("\(coins)")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                        .bold()
                    }
                Image(systemName:"checkmark")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("DarkGray"))
            }else{
                Rectangle()
                    .foregroundColor(Color("MediumGray"))
                    .frame(width: 50, height: 50)
                    .cornerRadius(20)
                VStack(spacing: 0){
                    Image("Coins")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("\(coins)")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                        .bold()
                    }
            }
        }
    }
    var dayTexts: some View{
        HStack(spacing: 20){
            Text("Day 1")
                .font(.system(size: 15))
                .bold()
            Text("Day 2")
                .font(.system(size: 15))
                .bold()
            Text("Day 3")
                .font(.system(size: 15))
                .bold()
            Text("Day 4")
                .font(.system(size: 15))
                .bold()
            Text("Day 5")
                .font(.system(size: 15))
                .bold()
        }.frame(alignment: .top)
    }
    
}

struct DailyStreakView_Previews: PreviewProvider {
    static var previews: some View {
        DailyStreakView()
            .previewLayout(.sizeThatFits)
    }
}
