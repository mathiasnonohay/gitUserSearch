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
        getUser(with: username)
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func getUser(with username: String) {
        parser.fetchUser(searchName: username) { data in
            self.user = data
            DispatchQueue.main.async {
                self.setView()
            }
        }
    }

    func setView() {
        guard let login = user?.login else { return }
        guard let name = user?.name else { return }
        detailView.nameUser = login
        detailView.name.text = name
        
        guard let avatarUrl = user?.avatarURL else { return }
        detailView.imageUrl = avatarUrl
        detailView.companyStr = user?.company ?? String.empty
        detailView.emailStr = user?.email ?? String.empty
        
        guard let repos = user?.publicRepos else { return }
        
        detailView.repositoriesStr =  String(describing: repos)
        detailView.websiteStr = user?.blog ?? String.empty
    }
}
