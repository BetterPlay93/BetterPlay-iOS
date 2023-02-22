//
//  NewPasswordView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct NewPasswordView: View {
    @Binding var show : Bool
    @State private var password = ""
    @State private var repeatPassword = ""
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .center, content: {
            Color.black.opacity(0.3).ignoresSafeArea()
           VStack(spacing: 10) {
               logo
               passwordTests
               confirmButton
               dots
           }
           .padding(.vertical, 25)
           .padding(.horizontal, 30)
           .background(Color("Background"))
           .cornerRadius(25)
           .frame(width: 327, height: 275)
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }

    var logo: some View {
       Image("Logo")
           .resizable()
           .scaledToFit()
           .frame(width: 125, height: 80)
    }
    var passwordTests: some View {
        VStack(spacing: 2){
            Text("Password")
                .frame(maxWidth: 234, alignment: .leading)
            TextField("",text: $password)
                .padding().frame(width: 234, height: 27)
                .background(Color(.white))
                .cornerRadius(10)
            
            Text("Repeat Password")
                .frame(maxWidth: 234, alignment: .leading)
            TextField("",text: $repeatPassword)
                .padding().frame(width: 234, height: 27)
                .background(Color(.white))
                .cornerRadius(10)
        }
    }
    var confirmButton: some View{
       Button {
           if password == repeatPassword{
               viewmodel.changePassword(password: password)
               if viewmodel.shouldShowLogin{
                   withAnimation{
                       show.toggle()
                   }
               }
           }
           
       } label: {
           Text("Confirmar")
               .foregroundColor(.white)
               .frame(width: 89, height: 32)
               .background(Color("DarkGray"))
               .cornerRadius(10)
               .frame(maxWidth: .infinity, alignment: .trailing)
               .padding()
       }.background(
        NavigationLink(destination: EmptyView(), isActive: $viewmodel.shouldShowLogin) {
            EmptyView()
        }
    )
    }

    var dots: some View {
       HStack {
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("Gray"))
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("Gray"))
           Circle()
               .frame(width: 20, height: 20)
               .foregroundColor(Color("DarkGray"))
       }
    }
}

//struct NewPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPasswordView()
//    }
//}
