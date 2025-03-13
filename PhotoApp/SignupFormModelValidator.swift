//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Paul F on 12/03/25.
//


import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
}


