//
//  GamePopularCollectionViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class GamePopularCollectionViewCell: UICollectionViewCell {
    
    let iconImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.contentMode = .scaleAspectFill
        aIV.layer.masksToBounds = true
        aIV.backgroundColor = .systemPurple
        return aIV
    }()
    
    let nameLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 17)
        aLabel.textColor = .black
        aLabel.isEnabled = true
        return aLabel
    }()
    
    let categoryLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 13)
        aLabel.textColor = .lightGray
        aLabel.isEnabled = true
        return aLabel
    }()
    
    let getButton: UIButton = {
        let aButton = UIButton()
        aButton.setTitle("Get", for: UIControl.State.normal)
        aButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        aButton.titleLabel?.font = .systemFont(ofSize: 17)
        aButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 247/255, alpha: 1)
        return aButton
    }()
    
    let bottomView: UIView = {
        let aView = UIView()
        aView.backgroundColor = .lightGray
        return aView
    }()
    
    var gamePopular: GamePopular? {
        didSet {
            guard let safeGamePopular = self.gamePopular else {return}
            self.nameLabel.text = safeGamePopular.appName
            self.categoryLabel.text = safeGamePopular.categoryName
            self.iconImageView.image = UIImage(named: safeGamePopular.iconImageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(iconImageView)
        iconImageView.anchorView(top: nil, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 55, height: 55)
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.anchorView(top: nil, left: self.iconImageView.rightAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        
        self.addSubview(categoryLabel)
        categoryLabel.anchorView(top: nil, left: self.iconImageView.rightAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 8).isActive = true
        
        self.addSubview(getButton)
        getButton.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 12, width: 80, height: 0)
        getButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        getButton.layer.cornerRadius = 15
        
        self.addSubview(bottomView)
        bottomView.anchorView(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: self.bounds.width - 40, height: 0.4)
    }
    
}
