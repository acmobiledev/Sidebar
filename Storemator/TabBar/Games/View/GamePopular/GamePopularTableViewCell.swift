//
//  GamePopularTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let popularGames: [GamePopular] = [GamePopular(appName: "Bullet Hell", categoryName: "Casual", iconImageName: "logo_broadcast"), GamePopular(appName: "Hot Wheels", categoryName: "Strategy", iconImageName: "logo_car"), GamePopular(appName: "SpellForce - Heroes", categoryName: "Card", iconImageName: "logo_jump"), GamePopular(appName: "Farm Punks", categoryName: "Role-Playing", iconImageName: "logo_smile"), GamePopular(appName: "Super Spinball", categoryName: "A musical journey awaits", iconImageName: "logo_weibo")]

 let reUseCellPopularIdentifier = "GamePopularCVCell"


class GamePopularTableViewCell: UITableViewCell {
    
    let popularCellHeaderView: GamePopularHeaderView = {
        let headerView = GamePopularHeaderView(frame: .zero)
        return headerView
    }()
    
    lazy var popularCollectionView: GamePopularCollectionView = {
        let flowLayout = GameCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: getCurrentWindow().bounds.size.width - 20, height: 78)
        
        let frame = CGRect.zero 
        let popularCV = GamePopularCollectionView(frame: frame, collectionViewLayout: flowLayout)
        popularCV.delegate = self
        popularCV.dataSource = self
        return popularCV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.addSubview(popularCellHeaderView)
        popularCellHeaderView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 42)
        
        contentView.addSubview(popularCollectionView)
        popularCollectionView.anchorView(top: self.popularCellHeaderView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 240)
    }
    
}


//MARK: - UICVDelegate, UICVDataSource
extension GamePopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularGames.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reUseCellPopularIdentifier, for: indexPath) as! GamePopularCollectionViewCell
            cell.bottomView.isHidden = ((indexPath.row + 1) % 3 == 0) || (indexPath.row == popularGames.count - 1)
            cell.gamePopular = popularGames[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("AAAAAAAA")
    }
}
