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
        //self-sizing tableView Cells (make sure updatesViewCell has a subview constraint to tableViewCell.contentView.bottomAnchor
        self.tableView.estimatedRowHeight = 220
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}


//MARK: - TV Data Source, Delegate
extension UpdatesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UpdatesViewCell
        if let cellState = cell.cellState?.rawValue {
            if cellState == 1 {
                tableView.beginUpdates()
                cell.contentLabel.numberOfLines = 1
                cell.cellState = CellState.init(rawValue: 0)
                cell.updatedModel = dataSource[indexPath.row]
                tableView.endUpdates()
                tableView.reloadData()
            }
        }
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

        //self-sizing tableViewCell
        self.tableView.beginUpdates()
        cell.contentLabel.numberOfLines = 0
        cell.cellState = CellState.init(rawValue: 1)
        
        self.tableView.endUpdates()
        self.tableView.reloadData()
        
    }
}

fileprivate let dataSource: [UpdateDataModel] = [UpdateDataModel(iconImageString: "logo_broadcast", appName: "Pokeman Go", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "New features! Widgets for your Home screen, Scribble support for iPad, new Complications for Apple Watch, integration with Wind Down, and more – available now for iOS 14, iPadOS 14, and watchOS 7. Things’ beautiful new Widgets live on your Home screen, right next to your app icons, where they can display any list you want. Quickly glance at what you’re doing Today, see what’s Upcoming on your schedule, stay on top of your most urgent project, view tag-filtered lists – the possibilities are endless!"), UpdateDataModel(iconImageString: "logo_weibo", appName: "Sina Weibo", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_game", appName: "Tiny Wings", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_jump", appName: "Alto Adventure", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "Fix bug and to be better for you") , UpdateDataModel(iconImageString: "logo_car", appName: "Threes", timeStamp: "11/22/2020", versionNumber: "2.0.0", appSize: 35.7, contentDesc: "[Play] Music radio broadcasting page revision, more immersed in music exploration \n\n[Mine] Rewriting sets the position of the night mode \n\n[Radio] Let's go with DJ and get up!")]

