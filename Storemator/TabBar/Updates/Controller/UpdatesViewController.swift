//
//  UpdatesViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

fileprivate let reUseUpdateCellIdentifier = "UpdatesCell"

class UpdatesViewController: UITableViewController {
    
    let updatesNavUserButton: UIButton = {
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
        self.addIconButtonOnGameNavigationBar()
        self.adjustGameNavigationAppearance()
        self.tableView.register(UpdatesViewCell.self, forCellReuseIdentifier: reUseUpdateCellIdentifier)
        self.tableView.separatorStyle = .none
       // self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = 160
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.reloadData()
    }
}


//MARK: - TV Data Source, Delegate
extension UpdatesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reUseUpdateCellIdentifier, for: indexPath) as! UpdatesViewCell
        cell.isFirstCell = (indexPath.row == 0)
        
        cell.moreButtonClosure = { (tappedCell) in
            self.updateRowSubviews(tappedCell)
        }
        cell.updatedModel = dataSource[indexPath.row]
        
        return cell
    }
}


//MARK: - Helpers
extension UpdatesViewController {
    
    func addIconButtonOnGameNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
         self.navigationController?.navigationBar.topItem?.title = "Updates"
        guard let navController = self.navigationController else { return }
        
        navController.navigationBar.addSubview(self.updatesNavUserButton)
        self.updatesNavUserButton.anchorView(top: nil, left: nil, bottom: navController.navigationBar.bottomAnchor, right: navController.navigationBar.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 10, width: 38, height: 38)
       }
    
    func adjustGameNavigationAppearance() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = nil
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    @objc func presentUserTableViewController() {
           print("User Pofile")
       }
    
    func updateRowSubviews(_ cell: UpdatesViewCell) {
        cell.cellState = CellState.init(rawValue: 1)
        self.tableView.reloadData()
        
    }
}

fileprivate let dataSource: [UpdateDataModel] = [UpdateDataModel(iconImageString: "logo_broadcast", appName: "Pokeman Go", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you"), UpdateDataModel(iconImageString: "logo_weibo", appName: "Sina Weibo", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_broadcast", appName: "Tiny Wings", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_broadcast", appName: "Alto Adventure", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_car", appName: "Threes", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "[Play] Music radio broadcasting page revision, more immersed in music exploration \n\n[Mine] Rewriting sets the position of the night mode \n\n[Radio] Let's go with DJ and get up!")]

