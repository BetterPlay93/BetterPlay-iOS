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
            VStack {
                header
                
                Searcher(text: $searcherText)
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.users.filter({ user in
                            searcherText.isEmpty ? true : user.username.contains(searcherText)
                        })) { user in
                            UserCard(user: user).padding(10)
                        }
                        
                    }
                }
            }
            
        }.background(Color("Background"))
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
