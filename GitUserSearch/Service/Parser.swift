//
//  Parser.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import Alamofire

struct Parser {
    // requestUsersURL = 'https://api.github.com/'
    // https://api.github.com/search/users
    // header = 'application/vnd.github.v3+json'
        
    fileprivate var baseURL = "https://api.github.com/"
    
        
        
    func fetchUserList(searchName: String, completionHandler: @escaping ([Item]) -> ()) {
            
        let endPoint = "search/users"
        let parameters: Parameters = [
            "q": "\(searchName)in:name"
            ]
        let headers: HTTPHeaders = [
            "Accept": "application/vnd.github.v3+json"
            ]
        
        AF.request(self.baseURL + endPoint, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).response { (responseData) in
            switch responseData.result {
            case .success(let data):
                do {
                    guard let jsonData = data else { return }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let userList = try decoder.decode(UserList.self, from: jsonData)
                    print(userList)
                    completionHandler(userList.items)
                } catch {
                    print(error)
                }
                break;
            case .failure(let error):
                print(error)
                break;
            }
        }
    }
    
    
    func fetchUser(searchName: String, completionHandler: @escaping (User) -> ()) {
        
        let endPoint = "https://api.github.com/users/\(searchName)"
        
        AF.request(endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            switch responseData.result {
            case .success(let data):
                do {
                    guard let jsonData = data else { return }
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: jsonData)
                    print(user)
                    completionHandler(user)
                } catch {
                    print(error)
                }
                break;
            case .failure(let error):
                print(error)
                break;
            }
        }
    }
    
}
