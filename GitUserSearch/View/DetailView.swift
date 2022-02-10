//
//  DetailView.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 10/02/22.
//

import UIKit

class DetailView: UIView {
    
    public var imageUrl: URL = URL(fileURLWithPath: String.empty) {
        didSet {
            self.imageView.load(url: imageUrl)
        }
    }

    public var nameStr: String = String.empty {
        didSet {
            self.name.text = nameStr
        }
    }
    
    public var nameUser: String = String.empty {
        didSet {
            self.userName.text = nameUser
        }
    }
    
    public var companyStr: String = String.empty {
        didSet {
            self.company.text = companyStr
        }
    }
    
    public var emailStr: String = String.empty {
        didSet {
            self.email.text = emailStr
        }
    }
    
    public var repositoriesStr: String = String.empty {
        didSet {
            self.repositories.text = repositoriesStr
        }
    }
    
    public var websiteStr: String = String.empty {
        didSet {
            self.website.text = websiteStr
        }
    }

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
        img.load(url: imageUrl)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var name: UILabel = {
        let lbl = UILabel()
        lbl.text = nameStr
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Username:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var userName: UILabel = {
        let lbl = UILabel()
        lbl.text = nameUser
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var companyLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Company:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var company: UILabel = {
        let lbl = UILabel()
        lbl.text = companyStr
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "E-mail:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var email: UILabel = {
        let lbl = UILabel()
        lbl.text = emailStr
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var repositoriesLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Repositories:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var repositories: UILabel = {
        let lbl = UILabel()
        lbl.text = repositoriesStr
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var websiteLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Website:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var website: UILabel = {
        let lbl = UILabel()
        lbl.text = websiteStr
        lbl.sizeToFit()
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
        
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 25),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            company.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 25),
            company.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            email.topAnchor.constraint(equalTo: company.bottomAnchor, constant: 25),
            email.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            repositories.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 25),
            repositories.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            website.topAnchor.constraint(equalTo: repositories.bottomAnchor, constant: 25),
            website.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
        ])
        fixed()
    }
    
    func fixed() {
        addSubview(nameLbl)
        addSubview(userNameLbl)
        addSubview(companyLbl)
        addSubview(emailLbl)
        addSubview(repositoriesLbl)
        addSubview(websiteLbl)
        
        NSLayoutConstraint.activate([
            
            nameLbl.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLbl.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            
            userNameLbl.centerYAnchor.constraint(equalTo: userName.centerYAnchor),
            userNameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            userNameLbl.trailingAnchor.constraint(equalTo: userName.trailingAnchor),
            
            companyLbl.centerYAnchor.constraint(equalTo: company.centerYAnchor),
            companyLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            companyLbl.trailingAnchor.constraint(equalTo: company.trailingAnchor),
            
            emailLbl.centerYAnchor.constraint(equalTo: email.centerYAnchor),
            emailLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            emailLbl.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            
            repositoriesLbl.centerYAnchor.constraint(equalTo: repositories.centerYAnchor),
            repositoriesLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repositoriesLbl.trailingAnchor.constraint(equalTo: repositories.trailingAnchor),
            
            websiteLbl.centerYAnchor.constraint(equalTo: website.centerYAnchor),
            websiteLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            websiteLbl.trailingAnchor.constraint(equalTo: website.trailingAnchor)
            
        ])
    }
    
}
