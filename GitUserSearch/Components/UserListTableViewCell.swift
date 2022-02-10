//
//  UserListTableViewCell.swift
//  GitUserSearch
//
//  Created by Mathias Nonohay on 09/02/22.
//

import UIKit

protocol UserListDelegate: NSObject {
        func didTapCell(_ cell: UserListTableViewCell)
    }

final class UserListTableViewCell: UITableViewCell {
    var actionBlock: (() -> Void)? = nil

    static let identifier = "UserCell"
    
    weak var delegate: UserListDelegate?
    
    public var nameUser: String = String.empty {
        didSet {
            self.userName.text = nameUser
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
         
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    lazy var userName: UILabel = {
        let lbl = UILabel()
        lbl.text = nameUser
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    @IBAction func didTapButton(sender: UIButton) {
        actionBlock?()
//            delegate?.didTapCell(self)
    }

    private func config() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userName)
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            userName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 25),

        ])
        
        
    }
    
    
}
