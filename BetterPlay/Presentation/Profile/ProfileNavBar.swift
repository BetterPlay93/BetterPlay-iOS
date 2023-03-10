//
//  ProfileNavBar.swift
//  BetterPlay
//
//  Created by Apps2T on 14/2/23.
//

import SwiftUI

struct ProfileNavBar: View {
    
    @State var selection: Int = 0
    var isCurrentUser: Bool = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                navBar
                filter
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .background(Color("Background2"))
        .onAppear {
            viewModel.getUserData()
        }
    }
    
    // MARK: - Accesory View
    var navBar: some View {
        ZStack {
            Rectangle()
                .fill(Color("Gray")).frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50)
            HStack {
                Text(viewModel.user.username)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.leading, 20)
                Spacer()
                
                NavigationLink {
                    UserSearcherView().navigationBarHidden(true)
                }label: {
                    Image("SearchUser")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .padding(.trailing, 10)
                }
                
                NavigationLink {
                    EditProfileView().navigationBarHidden(true)
                }label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 20)
                }
                
            }
        }
    }
    
    var filter: some View {
        VStack{
            HStack(spacing: 0){
                Picker("", selection: $selection){
                    Image(systemName: "person.crop.circle").tag(0)
                    Image(systemName: "heart.fill").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(20)
                
            }
            
            if selection == 0 {
                ProfileView(user: viewModel.user)
            }else{
                FriendProfileView()
            }
        }
    }
}

struct ProfileNavBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavBar()
    }
}
