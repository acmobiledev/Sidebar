//
//  DetailInformationTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let dataSource: [(String,String)] = [
    ("Seller", "Hangzhou NetEase Leihuo Technology Co., Ltd."),
    ("Size", "2.5GB"),
    ("Category", "Games: Strategy"),
    ("Compatibility", "Works on this iphone"),
    ("Languages", "Simplified Chinese"),
    ("Age Rating", "9+"),
    ("In-App Purchases", "Yes"),
    ("Copyright", "©1997-2019 网易公司版权所有")
]


class DetailInformationTableViewCell: UITableViewCell {   // 52 + 400( 50: cell)
    
    let sectionHeaderView: CommonSectionHeaderView = {
        let sectionHV = CommonSectionHeaderView(frame: .zero)
        sectionHV.topView.isHidden = false
        sectionHV.headerLabel.text = "Information"
        return sectionHV
    }()
    
    lazy var informationTableView: InformationTableView = {
        let informationTV = InformationTableView(frame: .zero)
        informationTV.delegate = self
        informationTV.dataSource = self
        return informationTV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(sectionHeaderView)
        sectionHeaderView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 52)
        
        self.addSubview(informationTableView)
        informationTableView.anchorView(top: self.sectionHeaderView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
}


//MARK: - UITVDelegate, UITVDataSource
extension DetailInformationTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.informationTableView {
            return dataSource.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.informationTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: reUseInformationIdentifier, for: indexPath) as! InformationTableViewCell
            cell.mainLabel.text = dataSource[indexPath.row].0
            cell.sideLabel.text = dataSource[indexPath.row].1
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
