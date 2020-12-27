//
//  InformationTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    let mainLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.textAlignment = .left
        aLabel.textColor = .lightGray
        aLabel.font = UIFont.systemFont(ofSize: 15)
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    let sideLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.textAlignment = .right
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 15)
        aLabel.numberOfLines = 0
        return aLabel
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
        self.addSubview(mainLabel)
        mainLabel.anchorView(top: nil, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 15, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(sideLabel)
        sideLabel.anchorView(top: nil, left: self.mainLabel.rightAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 20, bottomPadding: 0, rightPadding: 15, width: 0, height: 0)
        sideLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
