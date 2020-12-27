//
//  GameFeaturedTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

let reUseCellFeaturedIdentifier = "GameFeaturedTVCell"

class GameFeaturedTableViewCell: UITableViewCell {
    
    var detailClosure: (()->())?
    
    fileprivate let featuredGames: [GameFeatured] = [GameFeatured(appName: "Rolling Sky", featuredText: "MAJOR UPDATE", categoryName: "CARD", coverImageName: "cover_1"), GameFeatured(appName: "Clash Royale", featuredText: "NEW GAME", categoryName: "Strategy", coverImageName: "cover_2"), GameFeatured(appName: "Fast & Furious", featuredText: "REDISCOVER THIS", categoryName: "Racing", coverImageName: "cover_3")]
    
    lazy var gameFeaturedCollectionView: GameFeaturedCollectionView = {
        
        let flowLayout = GameCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: getCurrentWindow().bounds.size.width - 20, height: 300)
        
        let frame = CGRect.zero
        let gameFeaturedCV = GameFeaturedCollectionView(frame: frame, collectionViewLayout: flowLayout)
        gameFeaturedCV.delegate = self
        gameFeaturedCV.dataSource = self
        return gameFeaturedCV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.addSubview(self.gameFeaturedCollectionView)
        gameFeaturedCollectionView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 300)
    }
}


//MARK: - UICollectionViewDataSource, Delegate
extension GameFeaturedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.gameFeaturedCollectionView {
            return self.featuredGames.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == gameFeaturedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reUseCellFeaturedIdentifier, for: indexPath) as! GameFeaturedCollectionViewCell
            cell.featuredGame = self.featuredGames[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailClosure!()
    }
    
    
}
