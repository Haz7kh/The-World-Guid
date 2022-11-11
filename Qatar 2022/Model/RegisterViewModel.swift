//
//  RegisterViewModel.swift
//  Qatar 2022
//
//  Created by Khaled Almelhem on 2022-10-19.
//

import Foundation
import Firebase




class RegisterViewModel : ObservableObject {
    
    var email:String = ""
    var password:String = ""
    
    func register(completion: @escaping () -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password ) {(result, error) in
            if let  error = error {
                print(error.localizedDescription)
            }else {
                completion()
            }
            
        }
    }
    
}
