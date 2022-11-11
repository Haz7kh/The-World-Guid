//
//  RegisterView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-14.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
   
    @State private var email: String = ""
    @State private var password: String = ""
    
    @StateObject private var registerVM = RegisterViewModel()
        
    var body: some View {
        NavigationView {
            VStack {
                Image("login1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                
                TextField("Email", text: $registerVM.email)
                    .padding(.bottom, 20)
                Rectangle()
                     .foregroundColor(.red)
                     .frame(width: 360, height: 1)
                     .padding(.bottom, 10)
                
                SecureField("Password", text: $registerVM.password)
                Rectangle()
                     .foregroundColor(.red)
                     .frame(width: 360, height: 1)
                     .padding(.bottom, 10)
                
                Button("Create account") {
                   
                    registerVM.register {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 30)
                
                Spacer()
               
            }
            .padding()
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

