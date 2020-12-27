//
//  DetailTopFactsCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class DetailTopFactsCell: UITableViewCell {
    
    let logoImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.contentMode = .scaleAspectFill
        aIV.layer.masksToBounds = true
        aIV.image = UIImage(named: "logo_game")
        return aIV
    }()
    
    let appNameLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .boldSystemFont(ofSize: 22)
        aLabel.text = "Pokemon Go"
        aLabel.textColor = .black
        return aLabel
    }()
    
    let subTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 15)
        aLabel.text = "Th Best Game"
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    let firstButton: UIButton = {
        let aButton = UIButton(type: .custom)
        aButton.setImage(#imageLiteral(resourceName: "detail_download"), for: .normal)
        return aButton
    }()
    
    let ratingsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        aLabel.text = "4.0, 25 ratings"
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    let ageLabel: UILabel = {
           let aLabel = UILabel()
           aLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
           aLabel.text = "Age"
           aLabel.textColor = .lightGray
           return aLabel
       }()
    
    let secondButton: UIButton = {
        let aButton = UIButton(type: .custom)
        aButton.setImage(#imageLiteral(resourceName: "detail_more"), for: .normal)
        return aButton
    }()
    
    let ninePlusLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        aLabel.text = "9+"
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    let strategyLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        aLabel.text = "Strategy"
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    let thirtyOneLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        aLabel.text = "#31"
        aLabel.textColor = .lightGray
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
        
        self.addSubview(logoImageView)
        logoImageView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 20, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 118, height: 118)
        logoImageView.layer.cornerRadius = 18
        
        self.addSubview(appNameLabel)
        appNameLabel.anchorView(top: logoImageView.topAnchor, left: logoImageView.rightAnchor, bottom: nil, right: nil, topPadding: 10, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 25)
        
        self.addSubview(subTitleLabel)
        subTitleLabel.anchorView(top: appNameLabel.bottomAnchor, left: logoImageView.rightAnchor, bottom: nil, right: nil, topPadding: 6, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 18)
        
        self.addSubview(firstButton)
        firstButton.anchorView(top: nil, left: logoImageView.rightAnchor, bottom: logoImageView.bottomAnchor, right: nil, topPadding: 0, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 30, height: 30)
        
        self.addSubview(ratingsLabel)
        ratingsLabel.anchorView(top: logoImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 60, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 14)
        
        self.addSubview(ageLabel)
        ageLabel.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 0, height: 14)
        ageLabel.centerYAnchor.constraint(equalTo: ratingsLabel.centerYAnchor).isActive = true
        
        self.addSubview(secondButton)
        secondButton.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 30, height: 30)
        secondButton.centerYAnchor.constraint(equalTo: firstButton.centerYAnchor).isActive = true
        
        self.addSubview(ninePlusLabel)
        ninePlusLabel.anchorView(top: nil, left: nil, bottom: ageLabel.topAnchor, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 0, width: 0, height: 22)
        ninePlusLabel.centerXAnchor.constraint(equalTo: ageLabel.centerXAnchor).isActive = true
        
        self.addSubview(strategyLabel)
        strategyLabel.anchorView(top: nil, left: nil, bottom: nil, right: ageLabel.leftAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 45, width: 0, height: 14)
        strategyLabel.centerYAnchor.constraint(equalTo: ratingsLabel.centerYAnchor).isActive = true
        
        self.addSubview(thirtyOneLabel)
        thirtyOneLabel.anchorView(top: nil, left: nil, bottom: strategyLabel.topAnchor, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 10.5, rightPadding: 0, width: 0, height: 22)
        thirtyOneLabel.centerXAnchor.constraint(equalTo: strategyLabel.centerXAnchor).isActive = true
    }
}
