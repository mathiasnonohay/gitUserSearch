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
    var searchName = String.empty
    let mainView = MainView(frame: .zero)
    lazy var searchBar:UISearchBar = UISearchBar()
    
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchBar()
    }
    
    func configTableView() {
        let tableView = mainView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
    }
    
    func configSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search user..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell  else { return UITableViewCell() }
        
        cell.nameUser = userList[indexPath.row].login
        
        guard let avatar = userList[indexPath.row].avatarURL else { return cell }
        
        cell.imageUrl = avatar
        print(userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navC = self.navigationController else { return }
        let detailCoordinator = DetailCoordinator(navigationController: navC)
        detailCoordinator.username = userList[indexPath.row].login
        detailCoordinator.start()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchName = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
        parser.fetchUserList(searchName: searchName) { data in
            self.userList = data
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
    }
        
    
}


