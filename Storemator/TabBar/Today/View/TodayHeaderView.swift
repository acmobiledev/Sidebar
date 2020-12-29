//
//  TodayHeaderView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

class TodayHeaderView: UIView {
    
    var userAccountDisclosure: (() -> Void)?
    
    let dateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "SATURDAY, DECEMBER 25"
        aLabel.textColor = .lightGray
        aLabel.font = .boldSystemFont(ofSize: 13)
        return aLabel
    }()
    
    let todayLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "Today"
        aLabel.font = .boldSystemFont(ofSize: 32)
        return aLabel
    }()
    
    let userProfileButton: UIButton = {
        let aButton = UIButton()
        aButton.setImage(#imageLiteral(resourceName: "demo_icon"), for: UIControl.State.normal)
        aButton.setImage(#imageLiteral(resourceName: "demo_icon"), for: UIControl.State.highlighted)
        aButton.layer.borderColor = GlobalConstants.iconBorderColor
        aButton.layer.borderWidth = GlobalConstants.iconBorderWidth
        aButton.addTarget(self, action: #selector(userButtonTapped), for: UIControl.Event.touchUpInside)
        return aButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(dateLabel)
        dateLabel.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 20, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(todayLabel)
        todayLabel.anchorView(top: self.dateLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 10, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(userProfileButton)
        userProfileButton.anchorView(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 35, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 45, height: 45)
        userProfileButton.layer.cornerRadius = 22
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Helper Methods
extension TodayHeaderView {
    @objc func userButtonTapped() {
       print("User Button Tapped")
        self.userAccountDisclosure!()
    }
}
