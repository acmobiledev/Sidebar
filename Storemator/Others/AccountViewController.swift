//
//  AccountViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/29/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    typealias RowModel = [String: String]
    
    var user: User {
        return User(username: "AC", imageString: "demo_icon", emailID: "abc@xyz.com")
    }
    
    fileprivate var tableViewDataSource: [[String: Any]] {
        get {
            return TableKeys.populateTableView(user: user)
        }
    }
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(AccountViewCell.self, forCellReuseIdentifier: "AccountViewCell")
        view.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return view
    }()
    
    let cellImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.isUserInteractionEnabled = true
        aIV.contentMode = .scaleAspectFill
        aIV.backgroundColor = .brown
        return aIV
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Account"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.anchorView(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleDoneButton))
    }
    
}


//MARK: - TVDataSource
extension AccountViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows(at: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = self.rowModel(at: indexPath)    //[String: String]
        var cell = UITableViewCell()
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        if title == user.username {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "AccountViewCell", for: indexPath)
        }
        
        cell.textLabel?.text = title
        
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.addSubview(self.cellImageView)
            cellImageView.image = UIImage(named: imageName)
            cellImageView.anchorView(top: nil, left: cell.leftAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 5, bottomPadding: 0, rightPadding: 0, width: 50, height: 50)
            cellImageView.layer.cornerRadius = 25
            cellImageView.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        }
        
        if title == user.username {
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
            cell.detailTextLabel?.textColor = .lightGray
            cell.textLabel?.anchorView(top: nil, left: self.cellImageView.rightAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
            cell.textLabel?.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: -10).isActive = true
            cell.detailTextLabel?.anchorView(top: nil, left: self.cellImageView.rightAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
            cell.detailTextLabel?.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: +10).isActive = true
        }
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    fileprivate func rows(at Section: Int) -> [Any] {
        return tableViewDataSource[Section][TableKeys.Rows] as! [Any]
    }
    
    fileprivate func title(at Section: Int) -> String? {
        return tableViewDataSource[Section][TableKeys.Section] as? String
    }
    
    fileprivate func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
    
}


//MARK: - TVDelegate
extension AccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        if title == user.username {
            return 70.0
        } else {
            return 45.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return
        }
        
        if title == TableKeys.signOut || title == "Redeem Gift Card or Code" || title == "Add Funds to Apple ID" {
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .none
        } else if title == "Purchased" || title == "Personalized Recommendations" {
            
            cell.textLabel?.textColor = .black
            cell.accessoryType = .disclosureIndicator
        } else {
            cell.accessoryType = .disclosureIndicator
        }
    }
}


//MARK: - Helpers
extension AccountViewController {
    @objc func handleDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
