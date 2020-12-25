//
//  GameFeaturedCollectionView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let reUseCellIdentifier = "GameFeaturedCollectionCell"

class GameFeaturedCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = .white
        self.register(GameFeaturedCollectionViewCell.self, forCellWithReuseIdentifier: reUseCellIdentifier)
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
