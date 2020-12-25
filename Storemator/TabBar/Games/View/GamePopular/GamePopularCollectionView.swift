//
//  GamePopularCollectionView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let reUseIdentifier = "GamePopularCollectionCell"

class GamePopularCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
        self.register(GamePopularCollectionViewCell.self, forCellWithReuseIdentifier: reUseIdentifier)
        self.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
