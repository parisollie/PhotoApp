import Foundation

//Paso 1.41
class MockURLProtocol: URLProtocol {
    
    //Paso 1.43
    static var stubResponseData: Data?
    //paso 2.20
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    //Paso 1.42
    override func startLoading() {
        //paso 2.21
           if let error = MockURLProtocol.error {
               let stubNSError = NSError(domain: "StubNSError", code: -99, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
               //Paso 2.19
               self.client?.urlProtocol(self, didFailWithError: stubNSError)
           } else {
               //Paso 2.22
               self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
           }
           //Paso 1.44
           self.client?.urlProtocolDidFinishLoading(self)
       }
    //paso 1.45
    override func stopLoading() { }
    
}
