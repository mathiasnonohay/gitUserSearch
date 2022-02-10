//
//  Service.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import Foundation

class Service {
    
    func fetchUser (userName: String, success: @escaping ( _ success: User?) -> (), failure: @escaping ( _ error: String) -> ()){
        
        let urlBuilder = URLComponents(string: "https://api.github.com/users/\(userName)")

        guard let url = urlBuilder?.url else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Accept", forHTTPHeaderField: "application/vnd.github.v3+json")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                failure(error?.localizedDescription ?? "Error")
                print(error?.localizedDescription)
                return
            } else {
                do {
                    guard let jsonData = data else { return }
                    let result = try JSONDecoder().decode(User.self, from: jsonData)
                    success(result)
                } catch {
                    guard let error = response?.description else { return }

                    failure(error)
                }
            }
        }.resume()
    }
}
