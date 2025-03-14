import Foundation

//Paso 1.21
class SignupWebService: SignupWebServiceProtocol {
    
    //Paso 1.34
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        //Paso 1.38
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    //paso 1.24
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        //Paso 1.35
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        //Paso 1.36
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        //Paso 1.37
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            //Paso 1.39
            if let requestError = error {
                //paso 2.10,checar
                //Paso 2.18
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            //Paso 1.40
            if let data=data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                //Paso 1.60
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
}
