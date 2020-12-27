//
//  GameDetailViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

fileprivate let reUseCellIdentifierTopFacts = "TopFactsCell"
fileprivate let reUseCellIdentifierNewFeatures = "NewFeaturesCell"
fileprivate let reUseCellIdentifierReview = "ReviewCell"
fileprivate let reUseCellIdentifierInformation = "InformationCell"

class GameDetailViewController: UIViewController {
    
    lazy var navigationView: DetailNavigationView = {
        let nv = DetailNavigationView(frame: .zero)
        return nv
    }()
    
    lazy var detailTableView: UITableView = {
        
        let detailTV = UITableView(frame: .zero)
        detailTV.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        detailTV.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        detailTV.backgroundColor = .white
        detailTV.delegate = self
        detailTV.dataSource = self
        
        detailTV.register(DetailTopFactsCell.self, forCellReuseIdentifier: reUseCellIdentifierTopFacts)
        detailTV.register(DetailNewFeatureViewCell.self, forCellReuseIdentifier: reUseCellIdentifierNewFeatures)
        detailTV.register(DetailReviewTableViewCell.self, forCellReuseIdentifier: reUseCellIdentifierReview)
        detailTV.register(DetailInformationTableViewCell.self, forCellReuseIdentifier: reUseCellIdentifierInformation)
        
        return detailTV
    }()
    
    lazy var topImageView: UIImageView = {
        let tIV = UIImageView()
        tIV.contentMode = .scaleAspectFill
        tIV.layer.masksToBounds = true
        tIV.image = #imageLiteral(resourceName: "cover_detail")
        return tIV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.detailTableView)
        detailTableView.anchorView(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topPadding: -20, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        self.view.addSubview(self.topImageView)
        topImageView.anchorView(top: self.view.topAnchor, left: self.detailTableView.leftAnchor, bottom: nil, right: self.detailTableView.rightAnchor, topPadding: -20, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 220)
        
        self.view.addSubview(self.navigationView)
        navigationView.anchorView(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 45)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationView.goBackClosure = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}


//MARK: - DetailTableView Delegate, DataSource
extension GameDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.detailTableView {
            return 4
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.detailTableView {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellIdentifierTopFacts, for: indexPath) as! DetailTopFactsCell
                cell.selectionStyle = .none
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellIdentifierNewFeatures, for: indexPath) as! DetailNewFeatureViewCell
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellIdentifierReview, for: indexPath) as! DetailReviewTableViewCell
                cell.selectionStyle = .none
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: reUseCellIdentifierInformation, for: indexPath) as! DetailInformationTableViewCell
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.detailTableView {
            switch indexPath.row {
            case 0:
                return 230
            case 1:
                return 168
            case 2:
                return 220
            case 3:
                return 520
            default:
                return 0
            }
        } else {
            return 0
        }
    }
}


//MARK: - UIScrollViewDelegate
extension GameDetailViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //        var offSetY = scrollView.contentOffset.y
        //
        //        // change topImageView frame
        //        if offSetY < -originalContentOffSetY {
        //            topImageView.frame.origin.y = offSetY - (hasTopNotch() ? 44 : 64)
        //            topImageView.frame.size.height = -(offSetY - (hasTopNotch() ? 44 : 64))
        //        }
        //
        //        // change navigationView backgroundColor and goBackBtn color
        //        //deal with offsetY to make sure alpha from 0 to 1
        //        if offSetY > -(originalContentOffSetY - alphaChangeProgress) {
        //            offSetY = -(originalContentOffSetY - alphaChangeProgress)
        //        } else if offSetY < -originalContentOffSetY {
        //            offSetY = -originalContentOffSetY
        //        }
        //
        //        let calculateY = offSetY + originalContentOffSetY
        //
        //        navigationView.backgroundColor = UIColor.white.withAlphaComponent(calculateY/alphaChangeProgress)
        //
        //        // values of targetRed and targetGreen are from GlobalConstants.textBlueColor
        //        // blue is still 255.0, so we do not neet to change it
        //        let targetRed: CGFloat = 0
        //        let targetGreen: CGFloat = 122
        //
        //        let color = UIColor(red: (255 - ((255.0 - targetRed)/alphaChangeProgress) * calculateY) / 255.0, green: (255 - ((255.0 - targetGreen)/alphaChangeProgress) * calculateY) / 255.0, blue: 255.0/255.0, alpha: 1)
        //
        //        navigationView.goBackBtn.setTitleColor(color, for: .normal)
        //        navigationView.goBackBtn.tintColor = color
    }
}
