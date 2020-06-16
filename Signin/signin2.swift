//
//  signin2.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.
//

import Foundation

protocol SigninAPIClient {
    func signin(optionalEmail: String?,
                optionalPassword: String?,
                completion: @escaping (_ user: User?, _ error: Error?) -> ())
}

final class SigninAPIClientImplementation: SigninAPIClient {
    
    func signin(optionalEmail: String?,
                optionalPassword: String?,
                completion: @escaping (_ user: User?, _ error: Error?) -> ()) {
        guard let email = optionalEmail else {
            completion(nil, GeneralError.EmailInValid)
            
            return
        }
        
        guard let password = optionalPassword else {
            completion(nil, GeneralError.PasswordInvalid)
            return
        }
        
        let userFiltered = users.filter { $0.email == email && $0.password == password}
        
        guard let currentUser = userFiltered.first else {
            completion(nil,  GeneralError.CannotFoundUser)
            return
        }
        
        completion(currentUser, nil)
        
    }
    
}
