//
//  DetailNewFeatureViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class DetailNewFeatureViewCell: UITableViewCell {
    
    let firstLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "What's News"
        aLabel.font = UIFont.boldSystemFont(ofSize: 22)
        aLabel.textColor = .black
        return aLabel
    }()
    
    let secondLabel: UILabel = {
           let aLabel = UILabel()
        aLabel.text = "Version 5.3.4"
        aLabel.font = .systemFont(ofSize: 15)
        aLabel.textColor = .lightGray
           return aLabel
       }()
    
    let thirdLabel: UILabel = {
           let aLabel = UILabel()
        aLabel.text = "Version History"
        aLabel.font = .systemFont(ofSize: 17)
        aLabel.textColor = .systemBlue
           return aLabel
       }()
    
    let fourthLabel: UILabel = {
           let aLabel = UILabel()
        aLabel.text = "Two days Ago"
        aLabel.font = .systemFont(ofSize: 14)
        aLabel.textColor = .lightGray
           return aLabel
       }()
    
    let fifthLabel: UILabel = {
           let aLabel = UILabel()
        aLabel.text = "Version 5.3.4"
        aLabel.font = .systemFont(ofSize: 15)
        aLabel.textColor = .black
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
        
        self.addSubview(firstLabel)
        firstLabel.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 14, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 22)
        
        self.addSubview(secondLabel)
        secondLabel.anchorView(top: firstLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 15, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 15)
        
        self.addSubview(thirdLabel)
        thirdLabel.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 0, height: 0)
        thirdLabel.centerYAnchor.constraint(equalTo: firstLabel.centerYAnchor).isActive = true
        
        self.addSubview(fourthLabel)
        fourthLabel.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 0, height: 0)
        fourthLabel.centerYAnchor.constraint(equalTo: self.secondLabel.centerYAnchor).isActive = true
        
        self.addSubview(fifthLabel)
        fifthLabel.anchorView(top: self.secondLabel.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 14, leftPadding: 20, bottomPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
}
