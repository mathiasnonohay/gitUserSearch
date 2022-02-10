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
    var filterList: [Item] = []
    var isSearch = false
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
        parser.fetchUserList(searchName: String.empty) { data in
            self.userList = data
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func configSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearch) {
            return filterList.count
        }else{
           return userList.count
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell  else { return UITableViewCell() }
        
        if (isSearch) {
            cell.textLabel?.text = filterList[indexPath.row].login
            return cell
        }
        else {
            cell.textLabel?.text = userList[indexPath.row].login
            print(userList[indexPath.row])
            return cell
        }
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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
               isSearch = true
        }
           
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
               isSearch = false
        }
           
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
               isSearch = false
        }
           
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
               isSearch = false
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.count == 0 {
                isSearch = false
                self.mainView.tableView.reloadData()
            } else {
                filterList = userList.filter({ (text) -> Bool in
                    let tmp: NSString = text.login as NSString
                    let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                    return range.location != NSNotFound
                })
                if(filterList.count == 0){
                    isSearch = false
                } else {
                    isSearch = true
                }
                self.mainView.tableView.reloadData()
            }
        }
}


