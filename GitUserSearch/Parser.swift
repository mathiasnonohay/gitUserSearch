//
//  Parser.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import Foundation

struct Parser {
    
    func parse() {
//        let urlBuilder = URLComponents(string: "https://api.androidhive.info/contacts/")
//        guard let url = URL(string: "https://api.github.com/users/torvalds") else { return }
//        guard let url = URL(string: "ps://api.github.com/search/users?q=in:name") else { return }
        
        
//        let url = URL(string: "https://api.androidhive.info/contacts/")
//        let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")
        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("Accept", forHTTPHeaderField: "application/vnd.github.v3+json")
        
//        guard let url = URL(string: "https://api.github.com/repos/NCX-Programming/RNGTool/releases/latest") else {
//            print("Invalid URL")
//            return
//        }
        
        var urlBuilder = URLComponents(string: "https://api.github.com/search/users")
        urlBuilder?.queryItems = [
            URLQueryItem(name: "q", value: "in:name")
        ]
        guard let url = urlBuilder?.url else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Accept", forHTTPHeaderField: "application/vnd.github.v3+json")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            } else {
                do {
//                    guard let jsonData = data else { return }
                    let result = try JSONDecoder().decode(TaskEntry.self, from: data!)
                    print(result)
                } catch {
                    guard let error = response?.description else { return }
                    print(error)
                }
            }
        }.resume()
    }
    
}
