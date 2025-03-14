import Foundation

//paso 1.27
//Paso 2.17, le ponemos Equatable
//paso 2.24, le ponemos el LozalizedError
enum SignupError: LocalizedError, Equatable {
    //Paso 2.7
    case invalidResponseModel
    case invalidRequestURLString
    
    //Paso 2.16
    case failedRequest(description: String)
    
    //Paso 2.25
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
    
}
