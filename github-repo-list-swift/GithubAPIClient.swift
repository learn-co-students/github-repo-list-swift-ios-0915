
import UIKit

class GithubAPIClient {
    
    enum madeUpErrors: Error {
        case stupid
        case moreThanStupid
    }
    
    class func getRepositories(with completion: @escaping ([Dictionary <String, Any>]) -> Void) {
        
        guard let myURL = URL(string: "https://api.github.com/repositories?client_id=\(Constant.ClientId)&client_secret=\(Constant.ClientSecret)")
            else {
                print("\n\nURL INIT FAILED\n\n")
                //throw madeUpErrors.moreThanStupid
                return
        }
        let urlRequest = URLRequest(url: myURL)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print("ERROR ERROR ERROR: \(error?.localizedDescription)")
            }
            else {
                if response != nil {
                    if let httpResponse = response as? HTTPURLResponse {
                        print("\nresponse code = \(httpResponse.statusCode)\n")
                    }
                }
        
                if data != nil {
                    let responseArray = try? JSONSerialization.jsonObject(with: data!, options: []) as! [Dictionary <String, Any>]
                
                    //print("\nDATA: \(data)\n")
                    //print("\nresponseDict: \(responseDict)")
                    completion(responseArray!)
                }
            }
        }
        dataTask.resume()
    }
    
    //class func retrieveSpecific
}
    


