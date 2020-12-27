//
//  DetailNavigationView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/26/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

class DetailNavigationView: UIView {
    
    var goBackClosure: (() -> ())?
    
    lazy var goBackButton: UIButton = {
        let aButton = UIButton()
        aButton.setTitle("Back", for: .normal)
        aButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        aButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        let image = UIImage(named: "navigation_back")?.withRenderingMode(.alwaysTemplate)
        aButton.setImage(image, for: UIControl.State.normal)
        aButton.tintColor = .systemBlue
        aButton.addTarget(self, action: #selector(backButtonPressed), for: UIControl.Event.touchUpInside)
        return aButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(goBackButton)
        goBackButton.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: (self.window?.windowScene?.statusBarManager?.statusBarFrame.height)! + 8, leftPadding: 8, bottomPadding: 0, rightPadding: 0, width: 80, height: 35)
    }
}


//MARK: - Helpers
extension DetailNavigationView {
    @objc func backButtonPressed() {
        print("Back Button")
        // delegate.backButtonPressed()
        //should assign DetailViewController a delegate and dismiss detailViewController
        self.goBackClosure!()
    }
}
