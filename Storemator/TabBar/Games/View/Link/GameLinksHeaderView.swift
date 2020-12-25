//
//  GameLinksHeaderView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class GameLinksHeaderView: UIView {

    let topView: UIView = {
        let aView = UIView()
        aView.backgroundColor = .lightGray
        return aView
    }()
    
    let popularLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = UIFont.monospacedSystemFont(ofSize: 22, weight: UIFont.Weight.medium)
        aLabel.text = "See Links"
        aLabel.textColor = .black
        return aLabel
    }()
    
    lazy var sideButton: UIButton = {
        let aButton = UIButton()
        aButton.setTitle("See All", for: UIControl.State.normal)
        aButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        aButton.titleLabel?.font = .systemFont(ofSize: 17)
        return aButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(topView)
        topView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: self.bounds.width, height: 0.6)
        
        self.addSubview(popularLabel)
        popularLabel.anchorView(top: nil, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        popularLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(sideButton)
        sideButton.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 12, width: 0, height: 0)
        sideButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

}
