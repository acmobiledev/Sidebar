//
//  SearchViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/29/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.textColor = .systemBlue
        self.textLabel?.font = .systemFont(ofSize: 18)
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
