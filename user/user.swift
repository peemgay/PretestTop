//
//  user.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.
//

import Foundation

class User {
    var name: String
    var email: String
    var password: String
    
    init(name: String,
         email: String,
         password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
}
