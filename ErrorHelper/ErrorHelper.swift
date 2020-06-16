//
//  ErrorHelper.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.
//

import Foundation

enum GeneralError: Error {
    case EmailInValid
    case EmailInValidWhenRegister
    case ConfirmEmailInvalid
    case PasswordInvalid
    case PasswordInValidWhenRegister
    case CannotFoundUser
    case NameInValid
    case EmailNotMatching
    case ConfirmPasswordInValid
    case PasswordNotMatching
}


final class ErrorHelper {
    
    class func errorMessage(genernalError: GeneralError) -> String {
        switch genernalError {
        case .EmailInValid,
             .PasswordInvalid,
             .CannotFoundUser:
            return "ข้อมูล Email หรือ Password ของท่านไม่ถูกต้อง, กรุณาลองใหม่อีกครั้ง"
        case .EmailInValidWhenRegister:
            return "ข้อมูล Email ไม่ถูกต้อง, กรุณาลองใหม่อีกครั้ง"
        case .ConfirmEmailInvalid:
            return "ข้อมูล Confirm Email ไม่ถูกต้อง, กรุณาลองใหม่อีกครั้ง"
        case .PasswordInValidWhenRegister:
            return "ข้อมูล Password ไม่ถูกต้อง, กรุณาลองใหม่อีกครั้ง"
        case .EmailNotMatching:
            return "กรอก Email กับ Confirm Email ไม่ตรงกัน, กรุณาลองใหม่อีกครั้ง"
        case .PasswordNotMatching:
            return "กรอก Password กับ Confirm Password ไม่ตรงกัน, กรุณาลองใหม่อีกครั้ง"
        case .NameInValid:
            return "ข้อมูลชื่อ ไม่ถูกต้อง, กรุณาลองใหม่อีกครั้ง"
        case .ConfirmPasswordInValid:
            return "ข้อมูล Confirm Password ไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง"
        }
    }
    
}
