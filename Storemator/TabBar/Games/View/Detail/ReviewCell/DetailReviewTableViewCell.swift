//
//  DetailReviewTableViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let imageArray: [String] = ["cover_detail1", "cover_detail2","cover_detail"]

class DetailReviewTableViewCell: UITableViewCell {   // 160+42(height)
    
    let headerView: CommonSectionHeaderView = {
        let sectionHV = CommonSectionHeaderView(frame: .zero)
        sectionHV.headerLabel.text = "Review"
        sectionHV.topView.isHidden = true
        return sectionHV
    }()
    
    lazy var detailCollectionView: DetailReviewCollectionView = {
        let flowLayout = CommonCollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: getCurrentWindow().bounds.width - 40, height: 155)
        flowLayout.scrollDirection = .horizontal
        
        let reviewCV = DetailReviewCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        reviewCV.delegate = self
        reviewCV.dataSource = self
        return reviewCV
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
        self.addSubview(headerView)
        headerView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 42)
        
        self.addSubview(detailCollectionView)
        detailCollectionView.anchorView(top: self.headerView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 160)
    }
}


//MARK: - UICVDelegate, UICVDataSource
extension DetailReviewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.detailCollectionView {
            return imageArray.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.detailCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCVCell, for: indexPath) as! DetailReviewCollectionViewCell
            cell.coverImageView.image = UIImage(named: imageArray[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell selected")
    }
}
