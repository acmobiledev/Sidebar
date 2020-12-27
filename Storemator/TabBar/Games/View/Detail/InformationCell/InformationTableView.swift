//
//  InformationTableView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

let reUseInformationIdentifier = "InformationCell"

class InformationTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(InformationTableViewCell.self, forCellReuseIdentifier: reUseInformationIdentifier)
        self.rowHeight = 50
        self.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
