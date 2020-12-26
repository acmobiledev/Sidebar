//
//  GameLinkTableView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class GameLinkTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: reUseCellILinkdentifier)
        self.rowHeight = 45
        self.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
