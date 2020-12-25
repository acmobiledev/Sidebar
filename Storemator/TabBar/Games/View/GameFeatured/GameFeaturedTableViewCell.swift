//
//  GameFeaturedTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let reUseCollectionIdentifier = "GameFeaturedTVCell"

class GameFeaturedTableViewCell: UITableViewCell {
    
    fileprivate let featuredGames: [GameFeatured] = [GameFeatured(appName: "Game1", featuredText: "MAJOR UPDATE", categoryName: "CARD", coverImageName: "cover_1"), GameFeatured(appName: "Clash Royale", featuredText: "NEW GAME", categoryName: "Strategy", coverImageName: "cover_2"), GameFeatured(appName: "Fast & Furious", featuredText: "REDISCOVER THIS", categoryName: "Racing", coverImageName: "cover_3")]
    
    lazy var gameFeaturedCollectionView: GameFeaturedCollectionView = {
        
        let flowLayout = GameCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.itemSize = CGSize(width: getCurrentWindow().bounds.size.width - 40, height: 330)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let frame = CGRect(x: 0, y: 0, width: getCurrentWindow().bounds.size.width, height: 330)
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
}


//MARK: - Helper Methods
extension GameFeaturedTableViewCell {
    override func layoutSubviews() {
        self.addSubview(self.gameFeaturedCollectionView)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reUseCollectionIdentifier, for: indexPath) as! GameFeaturedCollectionViewCell
            cell.featuredGame = self.featuredGames[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Bring GameDetailVC")
    }
}
