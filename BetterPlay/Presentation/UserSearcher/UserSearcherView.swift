//
//  UserSearcherView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct UserSearcherView: View {
    
    @State private var searcherText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        ZStack(){
            VStack() {
                header.padding(.top, 45)
                
                Searcher(text: $searcherText)
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        UserCard(user: UserPresentationModel(username: "emilia", email: "emilia@gmail.com", coins: 4000, followers: 200, code: "", photo: "https://picsum.photos/200/300")).padding(10)
                        ForEach(viewModel.users.filter({ user in
                            searcherText.isEmpty ? true : user.username.contains(searcherText)
                        })) { user in
                            
                        }
                        
                    }
                }
                
                CustomTabBar(selectedTab: .constant(.Profile))
            }
            
        }.background(Color("Background2"))
        .ignoresSafeArea()
        .onAppear {
            viewModel.getAllUsers()
        }
    }
    
    var header: some View {
        ZStack {
            Rectangle()
                .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
            HStack(){
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .foregroundColor(Color.white)
                        .padding(.leading, 10)
                }
                
                Spacer()
                    
                Text("Usuarios")
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.trailing, 40)
                
                
                Spacer()
                
            }
        }
    }
}

struct UserSearcherView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearcherView()
    }
}
