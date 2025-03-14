import XCTest
@testable import PhotoApp

//Paso 1.18, creamos el test
class SignupWebServiceTests: XCTestCase {
    
    //paso 1.20
    var sut:SignupWebService!
    //Paso 2.2
    var signFormRequestModel:SignupFormRequestModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //Paso 2.1
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]

        let urlSession = URLSession(configuration: config)
        //paso 1.23
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        //paso 1.25
        signFormRequestModel = SignupFormRequestModel(firstName: "Harry", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //Paso 2.3
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        //Paso 2.27
        MockURLProtocol.error = nil
        
    }
    
    //Paso 1.19
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        
        //Paso 1.33 Arrange
        let jsonString = "{\"status\":\"ok\"}"
        //Paso 1.46
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        //Paso 1.31
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            //Paso 1.28 Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            //Paso 1.32
            expectation.fulfill()
            
        }
        //Paso 1.30
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    //Paso 1.48
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        //Paso 1.49
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        //Paso 2.0
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            //Paso 1.49
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    //Paso 2.4
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        //Paso 2.8 Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        //Paso 2.5
        sut = SignupWebService(urlString: "")
        
        //Paso 2.6 Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            //Paso 2.9
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    //Pas 2.12
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        //Paso 2.14 Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        //Paso 2.23
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // Act
        //Paso 2.13
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription), "The signup() method did not return an expecter error for the Failed Request")
            //Paso 2.11,checar
            //Paso 2.26
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        //Paso 2.15
        self.wait(for: [expectation], timeout: 2)
        
    }
}
