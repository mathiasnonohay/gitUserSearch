//
//  DetailViewController.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let parser = Parser()
    let detailView = DetailView()

    var username = String.empty
    var user: User?
        
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getUser(with: username)
        setView()
        
    }
    
    func getUser(with username: String) {
        parser.fetchUser(searchName: username) { data in
            self.user = data
        }
    }

    func setView() {
        detailView.nameUser = user?.login ?? String.empty
        detailView.name.text = user?.name
    }
    
}
