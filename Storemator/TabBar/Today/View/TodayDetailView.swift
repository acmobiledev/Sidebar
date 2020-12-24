//
//  TodayDetailView.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

class TodayDetailView: UIScrollView {
    
    //MARK: - Properties
    let containerView: UIView = {
        let aView = UIView()
        aView.layer.masksToBounds = true
        aView.backgroundColor = .purple
        return aView
    }()
    
    let detailImageView: UIImageView = {
        let aIV = UIImageView()
        aIV.isUserInteractionEnabled = true
        aIV.contentMode = .scaleAspectFill
        aIV.backgroundColor = .brown
        return aIV
    }()
    
    lazy var detailTextView: UITextView = {
        let aTV = UITextView()
        aTV.font = .boldSystemFont(ofSize: 16)
        aTV.textColor = .systemGray2
        aTV.isUserInteractionEnabled = true
        aTV.translatesAutoresizingMaskIntoConstraints = false
        aTV.isScrollEnabled = true
        aTV.text = "Thank you. I'm honored to be with you today for your commencement from one of the finest universities in the world. Truth be told, i never graduated from college and this is the closest I've ever gotten to a college gradution. \n\nToday i want to tell you three stories from my life. That's it. No big deal. Just three stories. The first story is about connecting the dots. \n\ndropped out of Reed College after the first 6 months, but then stayed around as a drop-in for another 18 months or so before I really quit. So why did I drop out? \n\nIt started before I was born. My biological mother was a young,unwed college graduate student, and she decided to put me up for adoption. She felt very strongly that I should be adopted by college graduates, so everything was all set for me to be adopted at birth by a lawyer and his wife. Except that when I popped out they decided at the last minute that they really wanted a girl. So my parents, who were on a waiting list, got a call in the middle of the night asking: 'We got an unexpected baby boy; do you want him?' They said: 'Of course.' My biological mother found out later that my mother had never graduated from college and  my father had never graduated from high school. She refused to sign the final adoption papers. She only relented a few months later when my parents promised that I would  go to college."
        
        return aTV
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(containerView)
        containerView.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: getCurrentWindow().bounds.size.width, height: 400)
        
        containerView.addSubview(detailImageView)
        detailImageView.anchorView(top: self.containerView.topAnchor, left: self.containerView.leftAnchor, bottom: self.containerView.bottomAnchor, right: self.containerView.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
        
        
        self.addSubview(detailTextView)
        
        detailTextView.anchorView(top: self.containerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topPadding: 30, leftPadding: 20, bottomPadding: 0, rightPadding: 20, width: getCurrentWindow().bounds.size.width - 40, height: detailTextView.text.calculateHeightWith(width: getCurrentWindow().bounds.size.width - 40, font: UIFont.boldSystemFont(ofSize: 17)))
        
        
        self.contentSize = CGSize(width: getCurrentWindow().bounds.width, height: containerView.frame.height + 40 + detailTextView.frame.height + 50)
    }
}
