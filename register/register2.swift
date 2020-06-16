//
//  register2.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.
//

import Foundation

protocol RegisterAPIClient {
    func register(optionalName: String?,
                  optionalEmail: String?,
                  optionalConfirmEmail: String?,
                  optionalPassword: String?,
                  optionalConfirmPassword: String?,
                  completion: @escaping (_ status: Bool, _ error: Error?) -> ())
}

final class RegisterAPIClientImplementation: RegisterAPIClient {
    
    func register(optionalName: String?,
                  optionalEmail: String?,
                  optionalConfirmEmail: String?,
                  optionalPassword: String?,
                  optionalConfirmPassword: String?,
                  completion: @escaping (Bool, Error?) -> ()) {
        guard let name = optionalName, name.count != 0 else {
            completion(false, GeneralError.NameInValid)
            return
        }
        
        guard let email = optionalEmail, email.count != 0 else {
            completion(false, GeneralError.EmailInValidWhenRegister)
            return
        }
        
        guard let confirmEmail = optionalConfirmEmail, confirmEmail.count != 0 else {
            completion(false, GeneralError.ConfirmEmailInvalid)
            return
        }
        
        guard email == confirmEmail else {
            completion(false, GeneralError.EmailNotMatching)
            return
        }
        
        guard let password = optionalPassword, password.count != 0 else {
            completion(false, GeneralError.PasswordInValidWhenRegister)
            return
        }
        
        guard let confirmPassword = optionalConfirmPassword, confirmPassword.count != 0 else {
            completion(false, GeneralError.ConfirmPasswordInValid)
            return
        }
        
        guard confirmPassword == password else {
            completion(false, GeneralError.PasswordNotMatching)
            return
        }
        
        users.append(User(name: name,
                          email: email,
                          password: password))
        
        completion(true, nil)
    }
    
}
