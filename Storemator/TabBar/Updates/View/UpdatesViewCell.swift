//
//  UpdatesViewCell.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate var imageViewTopPadding: CGFloat = 0

class UpdatesViewCell: UITableViewCell {
    
    var cellState = CellState.init(rawValue: 0)
    
    var moreButtonClosure: ((UpdatesViewCell) -> Void)?
    
    var isFirstCell: Bool = false {
        didSet {
            self.topLeftLabel.isHidden = !isFirstCell
            self.updateAllButton.isHidden = !isFirstCell
            imageViewTopPadding = isFirstCell ? 48 : 18
            self.constructSubviews()
        }
        
    }
    
    var updatedModel: UpdateDataModel? {
        didSet {
            guard let safeModel = self.updatedModel , let safeCellState = self.cellState else {return}
            self.iconImageView.image = UIImage(named: safeModel.iconImageString)
            self.appNameLabel.text = safeModel.appName
            self.dateLabel.text = safeModel.timeStamp
            self.contentLabel.text = safeModel.contentDesc
            self.versionAndSizeLabel.text = "Version " + safeModel.versionNumber + " . " + String(safeModel.appSize) + " MB"
            
            if safeCellState.rawValue == 0 {
                self.versionAndSizeLabel.isHidden = true
                self.showMoreButton.isHidden = false
            } else {
                self.versionAndSizeLabel.isHidden = false
                self.showMoreButton.isHidden = true
            }
            self.constructSubviews()
        }
    }
    
    
    
    let topLine: UIView = {
        let aView = UIView(frame: .zero)
        aView.backgroundColor = .lightGray
        return aView
    }()
    
    let iconImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.contentMode = .scaleAspectFill
        aIV.layer.masksToBounds = true
        aIV.backgroundColor = .purple
        return aIV
    }()
    
    let appNameLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 17)
        aLabel.textColor = .black
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    let dateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 13)
        aLabel.textColor = .lightGray
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    let updateButton: UIButton = {
        let aButton = UIButton(type: .system)
        aButton.setTitle("UPDATE", for: UIControl.State.normal)
        aButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        aButton.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        return aButton
    }()
    
    let contentLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 15)
        aLabel.textColor = .black
        aLabel.numberOfLines = 1
        return aLabel
    }()
    
    let topLeftLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "Pending"
        aLabel.font = UIFont.boldSystemFont(ofSize: 20)
        aLabel.textColor = .black
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    let updateAllButton: UIButton = {
        let aButton = UIButton(type: .system)
        aButton.setTitle("Update All", for: UIControl.State.normal)
        aButton.titleLabel?.font = .systemFont(ofSize: 18)
        return aButton
    }()
    
    let versionAndSizeLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 16)
        aLabel.textColor = .lightGray
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    lazy var showMoreButton: UIButton = {
        let aButton = UIButton(type: .system)
        aButton.setTitle("More", for: UIControl.State.normal)
        aButton.setTitleColor(.systemBlue, for: UIControl.State.normal)
        aButton.titleLabel?.font = .systemFont(ofSize: 15)
        aButton.addTarget(self, action: #selector(moreButtonPressed), for: UIControl.Event.touchUpInside)
        return aButton
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constructSubviews() {
        //        super.layoutSubviews()
        
        self.addSubview(topLine)
        topLine.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 1, leftPadding: 20, bottomPadding: 0, rightPadding: 20, width: 0, height: 0.5)
        
        self.addSubview(iconImageView)
        
        if self.isFirstCell {
            iconImageView.anchorView(top: topLine.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 48, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 62, height: 62)
            iconImageView.layer.cornerRadius = 14
        } else {
            iconImageView.anchorView(top: topLine.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 18, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 62, height: 62)
            iconImageView.layer.cornerRadius = 14
        }
        
        self.addSubview(appNameLabel)
        appNameLabel.anchorView(top: iconImageView.topAnchor, left: iconImageView.rightAnchor, bottom: nil, right: nil, topPadding: 13, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(dateLabel)
        dateLabel.anchorView(top: appNameLabel.bottomAnchor, left: appNameLabel.leftAnchor, bottom: nil, right: nil, topPadding: 4, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(updateButton)
        updateButton.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 80, height: 30)
        updateButton.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
        
        self.addSubview(contentLabel)
        contentLabel.anchorView(top: iconImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 23, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(topLeftLabel)
        topLeftLabel.anchorView(top: topLine.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topPadding: 13, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(updateAllButton)
        updateAllButton.anchorView(top: nil, left: nil, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 0, height: 0)
        updateAllButton.centerYAnchor.constraint(equalTo: topLeftLabel.centerYAnchor).isActive = true
        
        self.addSubview(versionAndSizeLabel)
        versionAndSizeLabel.anchorView(top: self.contentLabel.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topPadding: 10, leftPadding: 20, bottomPadding: 10, rightPadding: 0, width: 0, height: 0)
        
        self.addSubview(showMoreButton)
        showMoreButton.anchorView(top: nil, left: contentLabel.rightAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 2, bottomPadding: 0, rightPadding: 15, width: 46, height: 30)
        showMoreButton.centerYAnchor.constraint(equalTo: contentLabel.centerYAnchor).isActive = true
    }
    
}


//MARK: - Helper
extension UpdatesViewCell {
    @objc func moreButtonPressed() {
        moreButtonClosure!(self)
    }
}
