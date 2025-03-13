//
//  PhotoAppTests.swift
//  PhotoAppTests
//
//  Created by Paul F on 12/03/25.
//

import XCTest
@testable import PhotoApp

final class PhotoAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
            
            // Arrange
            let sut = SignupFormModelValidator()
            // Act
            let isFirstNameValid = sut.isFirstNameValid(firstName: "harris")
            
            // Assert
            XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
        }

}
