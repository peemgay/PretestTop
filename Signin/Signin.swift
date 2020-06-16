//
//  signin.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.

import Foundation

protocol SigninAPIManager {
    func signin(optionalEmail: String?,
                optionalPassword: String?)
    func setSigninAPIManagerDelegate(_ delegate: SigninAPIManagerDelegate?)
}

protocol SigninAPIManagerDelegate {
    func didSigninCompletion(user: User)
    func didSigninFailure(error: Error)
}

final class SigninAPIManagerImplementation: SigninAPIManager {
    
    let apiClient: SigninAPIClient
    
    var delegate: SigninAPIManagerDelegate?
    
    init(apiClient: SigninAPIClient = SigninAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setSigninAPIManagerDelegate(_ delegate: SigninAPIManagerDelegate?) {
        self.delegate = delegate
    }
    
    func signin(optionalEmail: String?,
                optionalPassword: String?) {
        apiClient.signin(optionalEmail: optionalEmail,
                         optionalPassword: optionalPassword)
        { (optionalUser, optionalError) in
            if let error = optionalError {
                self.delegate?.didSigninFailure(error: error)
                return
            }
            
            if let user = optionalUser {
                self.delegate?.didSigninCompletion(user: user)
                return
            }
        }
    }
}
