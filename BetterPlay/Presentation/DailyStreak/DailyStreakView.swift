//
//  DailyStreakView.swift
//  BetterPlay
//
//  Created by Apps2T on 17/2/23.
//

import SwiftUI

struct DailyStreakView: View {
    
    @Binding var isShowing: Bool
    //Falta recibir la racha de la petición del login y pasarsela a la función showStreak
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        if isShowing {
            ZStack(alignment: .center){
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 15, height: 230)
                    .cornerRadius(20)
                VStack(spacing: 20){
                    Rectangles
                    progressBarView(percentage: viewModel.percentage)
                    dayTexts
                    
                    Button {
                        withAnimation {
                            isShowing.toggle()
                        }
                    }label: {
                        Text("Pick Up")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 20))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color("DarkGray"))
                            .cornerRadius(10)
                    }
                }
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onAppear{
                viewModel.showStreak(streak: 2)
            }
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
            customCircle
            customCircle
            customCircle
            customCircle
            customCircle
        }
    }
    
    var customCircle: some View {
        Circle()
            .foregroundColor(Color("DarkGray"))
            .frame(width: 20, height: 20)
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
            customText(text: "Day 1")
            customText(text: "Day 2")
            customText(text: "Day 3")
            customText(text: "Day 4")
            customText(text: "Day 5")
        }.frame(alignment: .top)
    }
    
    func customText(text: String) -> some View {
        Text(text)
            .font(.system(size: 15))
            .bold()
    }
    
}

struct DailyStreakView_Previews: PreviewProvider {
    static var previews: some View {
        DailyStreakView(isShowing: .constant(true))
    }
}
