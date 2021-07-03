//
//  APIManager.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import Foundation

class APIManager: NSObject {
    
    static let shared = APIManager()

    override init() {
        
    }
    
    func apiRequest(apiName:String,parameters:[String:Any],HTTPMethod:httpMethod = .POST,completion:@escaping (Any)->Void,failed:@escaping (String)->Void) {
        
        var request = URLRequest(url: URL(string: apiName)!)
        request.httpMethod = HTTPMethod.rawValue
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                failed(err.localizedDescription)
                return
            }
            
            guard let httpResonse = response as? HTTPURLResponse,(200...299).contains(httpResonse.statusCode) else {
                failed("Error with the response, unexpected status code: \(response!)")
                return
            }
            
            if data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options:.mutableContainers) as! NSDictionary
                    if json.value(forKey: "status") as! Int == 0 {
                        failed(json.value(forKey: "msg") as? String ?? "")
                        return
                    }
                    if let model = try? JSONDecoder().decode(LoginModel.self, from: JSONSerialization.data(withJSONObject: json["response"] ?? [], options: .fragmentsAllowed)) {
                        completion(model)
                    }
                }
                catch let err {
                    failed(err.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    
}
