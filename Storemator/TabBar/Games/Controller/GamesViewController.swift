//
//  GamesViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

fileprivate let reuseCellIdentifier1 = "GameFeaturedTableViewCell"
fileprivate let reuseCellIdentifier2 = "GamePopularTableViewCell"
fileprivate let reuseCellIdentifier3 = "GameLinksTableViewCell"


class GamesViewController: UITableViewController {
    
    var isHidden = false
    
    let gameNavUserButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "demo_icon"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "demo_icon"), for: .highlighted)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = GlobalConstants.iconBorderColor
        btn.layer.borderWidth =  GlobalConstants.iconBorderWidth
        btn.layer.cornerRadius = 19
        btn.addTarget(self, action: #selector(presentUserTableViewController), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(GameFeaturedTableViewCell.self, forCellReuseIdentifier: reuseCellIdentifier1)
        self.tableView.register(GamePopularTableViewCell.self, forCellReuseIdentifier: reuseCellIdentifier2)
        self.tableView.register(GameLinkTableViewCell.self, forCellReuseIdentifier: reuseCellIdentifier3)
        
        self.addIconButtonOnGameNavigationBar()
        self.adjustGameNavigationAppearance()
//        self.setNavigationBarBottomLineHidden(true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("RRRRRRRRRRRRRRR-----\(getCurrentWindow().bounds.size.width)")
    }
}


//MARK: - TVDelegate TVDataSource
extension GamesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) || (section == 1) || (section == 2) {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 302
        } else if indexPath.section == 2 {
            return 312
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier1, for: indexPath) as! GameFeaturedTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier2, for: indexPath) as! GamePopularTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier3, for: indexPath) as! GameLinkTableViewCell
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


//MARK: - NavigationBar
extension GamesViewController {
    func setGameNavigationBarBottomLineHidden(_ isHidden: Bool) {
        self.navigationController?.navigationBar.setValue(isHidden, forKey: "hidesShadow")
    }
    
    func addIconButtonOnGameNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
         self.navigationController?.navigationBar.topItem?.title = "Game"
        guard let navController = self.navigationController else { return }
        
        navController.navigationBar.addSubview(self.gameNavUserButton)
        self.gameNavUserButton.anchorView(top: nil, left: nil, bottom: navController.navigationBar.bottomAnchor, right: navController.navigationBar.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 10, width: 38, height: 38)
       }
    
    func adjustGameNavigationAppearance() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = nil
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
