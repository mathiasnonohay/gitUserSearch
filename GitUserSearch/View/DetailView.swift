//
//  DetailView.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import UIKit

class DetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .gray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var name: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var userName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var company: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var email: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var repositories: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var website: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func configView() {
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(name)
        addSubview(userName)
        addSubview(company)
        addSubview(email)
        addSubview(repositories)
        addSubview(website)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: leadingAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            company.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            company.leadingAnchor.constraint(equalTo: leadingAnchor),
            company.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            email.topAnchor.constraint(equalTo: company.bottomAnchor, constant: 5),
            email.leadingAnchor.constraint(equalTo: leadingAnchor),
            email.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            repositories.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 5),
            repositories.leadingAnchor.constraint(equalTo: leadingAnchor),
            repositories.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            website.topAnchor.constraint(equalTo: repositories.bottomAnchor, constant: 5),
            website.leadingAnchor.constraint(equalTo: leadingAnchor),
            website.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
        ])
        
        
        
    }
    
}
