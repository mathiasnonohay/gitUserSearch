//
//  MainView.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 09/02/22.
//

import UIKit

protocol MainViewDelegate: NSObject {
    
    func didPressButton(button:UIButton)
    
}

class MainView: UIView {
    
    weak var delegate:MainViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    @objc func buttonPress(button:UIButton) {
        delegate?.didPressButton(button: button)
    }
    
    func configView() {
        backgroundColor = .white
        
        addSubview(tableView)
        addSubview(button)
        
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 30)
            
        
        ])
        
    }
    
    
    
}
