//
//  SearchViewController.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 09/02/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    let parser = Parser()
    var userList = [Item]()
    let mainView = MainView(frame: .zero)
    
//    func didPressButton(button: UIButton) {
//        guard let navigation = self.navigationController else { return }
//        let detailCoordinator = DetailCoordinator(navigationController: navigation)
//        detailCoordinator.start(name: )
//    }
    
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = mainView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
        parser.fetchUserList(searchName: String.empty) { data in
            self.userList = data
            DispatchQueue.main.async {
                tableView.reloadData()
            }
            
        }
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
        print(userList.count)
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell  else { return UITableViewCell() }
        cell.nameUser = userList[indexPath.row].login
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navC = self.navigationController else { return }
        let detailCoordinator = DetailCoordinator(navigationController: navC)
        detailCoordinator.username = userList[indexPath.row].login
        detailCoordinator.start()
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
 
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


