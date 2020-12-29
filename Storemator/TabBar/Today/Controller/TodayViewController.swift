//
//  TodayViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

fileprivate let reUseIdentifier = "TodayCell"

class TodayViewController: UITableViewController {
    
    var selectedCell: TodayViewCell?
    
    lazy var headerView: TodayHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: getCurrentWindow().bounds.size.width, height: 100)
        let aView = TodayHeaderView(frame: frame)
        aView.userAccountDisclosure = {
            let accountVC = AccountViewController()
            let navigationController = UINavigationController(rootViewController: accountVC)
            self.present(navigationController, animated: true, completion: nil)
        }
        return aView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.tableHeaderView = headerView
        self.tableView.register(TodayViewCell.self, forCellReuseIdentifier: reUseIdentifier)
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 440
    }
}


//MARK: - DataSource
extension TodayViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as! TodayViewCell
        if indexPath.row == 0 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
        } else {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_5")
        }
        return cell
    }
}


//MARK: - UITableViewDelegate
extension TodayViewController {
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = self.tableView.cellForRow(at: indexPath) as? TodayViewCell else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            row.bgView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = self.tableView.cellForRow(at: indexPath) as? TodayViewCell else {return}
        UIView.animate(withDuration: 0.3) {
            row.bgView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todayDetailVC = TodayDetailViewController()
        todayDetailVC.selectedCell = (self.tableView.cellForRow(at: indexPath) as! TodayViewCell)
        todayDetailVC.modalPresentationStyle = .fullScreen
        self.present(todayDetailVC, animated: true, completion: nil)
    }
}
