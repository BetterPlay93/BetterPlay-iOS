//
//  DailyStreakView.swift
//  BetterPlay
//
//  Created by Apps2T on 17/2/23.
//

import SwiftUI

struct DailyStreakView: View {
    //Falta recibir la racha de la petición del login y pasarsela a la función showStreak
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: .infinity, height: 230)
                .cornerRadius(20)
            VStack(spacing: 20){
                Rectangles
                progressBarView(percentage: viewModel.percentage)
                dayTexts
            }
        }.onAppear{
            viewModel.showStreak(streak: 4)
        }
    }
    var Rectangles: some View{
        HStack(spacing: 25){
            customRectangle(isCompleted: viewModel.firstDay, coins: 500)
            customRectangle(isCompleted: viewModel.secondDay, coins: 1000)
            customRectangle(isCompleted: viewModel.thirdDay, coins: 1500)
            customRectangle(isCompleted: viewModel.forthDay, coins: 2000)
            customRectangle(isCompleted: viewModel.fifthDay, coins: 3000)
        }.frame(alignment: .top)
    }
    func progressBarView(percentage: Int)-> some View{
        ZStack(alignment: .leading){
            CustomProgressView(progressColor: "DarkGray",progressBackgroundColor: "White", value:percentage)
                .frame(width: 310)
            barCircles
        }
    }
    	
    var barCircles: some View{
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
        HStack(spacing: 35){
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
