//
//  GamePopularTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/25/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let popularGames: [GamePopular] = [GamePopular(appName: "Bullet Hell", categoryName: "Casual", iconImageName: "logo_broadcast"), GamePopular(appName: "Hot Wheels", categoryName: "Strategy", iconImageName: "logo_car"), GamePopular(appName: "SpellForce - Heroes", categoryName: "Card", iconImageName: "logo_jump"), GamePopular(appName: "Farm Punks", categoryName: "Role-Playing", iconImageName: "logo_smile"), GamePopular(appName: "Super Spinball", categoryName: "A musical journey awaits", iconImageName: "logo_weibo")]

fileprivate let reUseCellIdentifier = "GamePopularCVCell"


class GamePopularTableViewCell: UITableViewCell {
    
    let popularCellHeaderView: GamePopularHeaderView = {
        let headerView = GamePopularHeaderView(frame: CGRect(x: 0, y: 0, width: getCurrentWindow().bounds.size.width, height: 42))
        return headerView
    }()
    
    lazy var popularCollectionView: GamePopularCollectionView = {
        let layout = GameCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: getCurrentWindow().bounds.size.width - 40, height: 80)
        
        let frame = CGRect(x: 0, y: 0, width: getCurrentWindow().bounds.size.width, height: 240)
        let popularCV = GamePopularCollectionView(frame: frame, collectionViewLayout: GameCollectionViewFlowLayout())
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
        super.layoutSubviews()
        self.addSubview(popularCellHeaderView)
        self.addSubview(popularCollectionView)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reUseCellIdentifier, for: indexPath) as! GamePopularCollectionViewCell
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
