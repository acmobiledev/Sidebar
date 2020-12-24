//
//  TodayDetailViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

class TodayDetailViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var todayDetailView: TodayDetailView = {
        let frame = self.view.bounds
        let detailView = TodayDetailView(frame: frame)
        detailView.delegate = self
        return detailView
    }()
    
    let closeButton: UIButton = {
        let aButton = UIButton()
        aButton.setImage(#imageLiteral(resourceName: "close_button"), for: UIControl.State.normal)
        aButton.addTarget(self, action: #selector(closeButtonTapped), for: UIControl.Event.touchUpInside)
        return aButton
    }()
    
    
    var selectedCell: TodayViewCell? {
        didSet {
            
            self.setupDetailImageView(cell: self.selectedCell!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.constructUIComponents()
    }
    
    func constructUIComponents() {
        self.view.addSubview(todayDetailView)
        self.view.addSubview(self.closeButton)
        closeButton.anchorView(top: self.view.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, topPadding: 25, leftPadding: 0, bottomPadding: 0, rightPadding: 15, width: 50, height: 50)
    }
    
}


//MARK: - UIScrollViewDelegate
extension TodayDetailViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y < -100.0 {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


//MARK: - Helper Methods
extension TodayDetailViewController {
    
    func setupDetailImageView(cell: TodayViewCell) {
        todayDetailView.detailImageView.image = cell.bgImageView.image
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
