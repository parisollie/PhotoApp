//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Paul F on 12/03/25.
//  Copyright © 2020 Paul F F. All rights reserved.
//

import XCTest
//paso 1.2
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {

    //Paso 1.8
    var sut: SignupFormModelValidator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //Paso 1.9
        sut = nil
    }
    

    // MARK: Last Name Validation Unit Tests
    //V23,paso 1.0
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        //Paso 1.1 Arrange
        //let sut = SignupFormModelValidator()
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Harris")
        
        //Paso 1.6 Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }

    // MARK: First Name Validation Unit Tests
    //Paso 1.7
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    //Paso 1.8
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "H")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
        
    }
    
    //Paso 1.9, el nombre solo debe tener 10 caracteres
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SergeySergey")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    //Paso 1.10
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "K")
        
        //Paso 1.13 Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
        
    }
    
    //Paso 1.14
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    //Paso 1.16
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }
    
    
    
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "KargopolovKargopolov")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Email Address Validation
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test.com")
        
        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
        
        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
    }
    
    // MARK: Password Validation
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
        
    }
    
   
    
    

}
