//
//  GitUserSearchTests.swift
//  GitUserSearchTests
//
//  Created by Mathias Nonohay on 09/02/22.
//

import XCTest
@testable import GitUserSearch

class GitUserSearchTests: XCTestCase {

    func testSearchCoordinator() throws {
        let navC = UINavigationController()
        let searchC = SearchCoordinator(navigationController: navC)
        
        searchC.start()
    }
    
    func testDetailhCoordinator() throws {
        let navC = UINavigationController()
        let detailC = DetailCoordinator(navigationController: navC)
        
        detailC.start()
    }
    
    func testApiOneUserCall() {
        let service = Parser()
        service.fetchUser(searchName: "mathiasnonohay") { user in
            XCTAssertNotNil(user)
            XCTAssert((user.login != nil), "mathiasnonohay")
            XCTAssertEqual(user.id, 50926854)
            XCTAssert((user.avatarURL != nil), "https://avatars.githubusercontent.com/u/50926854?v=4")
        }
    }
    
    func testApiUserListCall() {
        let service = Parser()
        service.fetchUserList(searchName: "Qwr") { item in
            XCTAssertNotNil(item)
        }
    }
    
    func testSearchViewController() {
        let searchVC = SearchViewController()
        let nav = UINavigationController()
        
        nav.pushViewController(searchVC, animated: true)
    }
    
    func testDeatailViewController() {
        let detailVC = DetailViewController()
        let nav = UINavigationController()
        
        nav.pushViewController(detailVC, animated: true)
    }


}
