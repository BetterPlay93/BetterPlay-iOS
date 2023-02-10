//
//  UserSearcherView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct UserSearcherView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack(){
            VStack {
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
                
                Searcher()
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        ForEach(0...10, id: \.self) {   _ in
                            UserCard().padding(10)
                        }
                        
                    }
                }
            }
            
        }.background(Color("Background"))
    }
}

struct UserSearcherView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearcherView()
    }
}
