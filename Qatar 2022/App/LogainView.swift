//
//  LogainView.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-14.
//


import SwiftUI

struct LoginView: View {
    
    @State var isPresented: Bool = false
    @State var isActive: Bool = false
    
    @ObservedObject private var loginVM = LoginViewModel()
        
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Image("login1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(.bottom, 20)
                    
                    TextField("Email", text: $loginVM.email)
                        .padding(.bottom, 10)
                    Rectangle()
                         .foregroundColor(.red)
                         .frame(width: 360, height: 1)
                         .padding(.bottom, 10)
                    
                    SecureField("Password", text: $loginVM.password)
                
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 360, height: 1)
                        .padding(.bottom, 30)
                  
                    Button("Login") {
                        loginVM.login {
                            isActive = true
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.bottom, 10)
                    
                    Button("Create account") {
                        isPresented = true
                    }.buttonStyle(SecondaryButtonStyle())
                   
                    Spacer()
                
                    
                    NavigationLink(
                        destination: UserImgListView(),
                                   
                       isActive: $isActive,
                        label: {
                        EmptyView()
                    })
                   
                    
                }
                .padding()
                .sheet(isPresented: $isPresented, content: {
                    RegisterView()
                })
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            }
            
        }
       
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
    }
}

