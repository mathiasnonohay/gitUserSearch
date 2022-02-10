//
//  SearchViewController.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 09/02/22.
//

import UIKit

class SearchViewController: UIViewController, MainViewDelegate {
    
    
    let parser = Parser()
    
    func didPressButton(button: UIButton) {
        guard let navigation = self.navigationController else { return }
        let detailCoordinator = DetailCoordinator(navigationController: navigation)
        parser.parse()
        detailCoordinator.start()
    }
    
    
    override func loadView() {
        let mainView = MainView(frame: .zero)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
        mainView.delegate = self
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    lazy var searchBar: UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        s.searchResultsUpdater = self
        
        s.obscuresBackgroundDuringPresentation = false
        s.searchBar.placeholder = "Search User..."
        s.searchBar.sizeToFit()
        s.searchBar.searchBarStyle = .prominent
        
        s.searchBar.delegate = self
        
        return s
    }()

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell  else { return UITableViewCell() }
        
        
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
 
    func updateSearchResults(for searchController: UISearchController) {
        
    }

    
    
}


