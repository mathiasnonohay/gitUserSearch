//
//  DetailCoordinator.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import UIKit

final class DetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController = DetailViewController()
        navigationController.setViewControllers([detailViewController], animated: true)
    }
}
