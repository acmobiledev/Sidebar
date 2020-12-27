//
//  DetailReviewCollectionViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class DetailReviewCollectionViewCell: UICollectionViewCell {
    
    let coverImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.contentMode = .scaleAspectFill
        aIV.layer.masksToBounds = true
        aIV.backgroundColor = .systemPurple
        return aIV
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
        self.addSubview(coverImageView)
        coverImageView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 0, width: 0, height: 0)
        coverImageView.layer.cornerRadius = 15
    }
}
