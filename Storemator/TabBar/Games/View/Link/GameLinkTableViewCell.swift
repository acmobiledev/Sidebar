//
//  GameLinkTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let linkDataSource: [String] = [
    "Add a Payment Method",
    "Parents' Guide to the App",
    "About In-App Purchases",
    "About Apps & Games for Your Kids",
    "About Personalisation",
    "New to the App Store",
]

 let reUseCellILinkdentifier = "GameLinkCell"

class GameLinkTableViewCell: UITableViewCell {

    let cellHeaderView: GameLinksHeaderView = {
        let frame = CGRect.zero
        let cHV = GameLinksHeaderView(frame: frame)
        return cHV
    }()
    
    lazy var cellTableView: GameLinkTableView = {
        let frame = CGRect.zero
        let cTV = GameLinkTableView(frame: frame)
        cTV.delegate = self
        cTV.dataSource = self
        return cTV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(cellHeaderView)
        cellHeaderView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 42)
        
        contentView.addSubview(cellTableView)
        cellTableView.anchorView(top: self.cellHeaderView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 270)
    }
    
    
}


//MARK: - UITVDelegate, UITVDataSource
extension GameLinkTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.cellTableView {
            return linkDataSource.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.cellTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellILinkdentifier, for: indexPath)
            cell.textLabel?.text = linkDataSource[indexPath.row]
            cell.textLabel?.textColor = .systemBlue
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
