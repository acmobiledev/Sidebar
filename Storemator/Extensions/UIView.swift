//
//  UIView.swift
//  EquationRenderer
//
//  Created by Amit Chaudhary on 11/16/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchorView(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topPadding: CGFloat, leftPadding: CGFloat, bottomPadding: CGFloat, rightPadding: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let safeTop = top {
            
            self.topAnchor.constraint(equalTo: safeTop, constant: topPadding).isActive = true
        }
        
        if let safeBottom = bottom {
            
            self.bottomAnchor.constraint(equalTo: safeBottom, constant: -bottomPadding).isActive = true
        }
        
        if let safeLeft = left {
            
            self.leftAnchor.constraint(equalTo: safeLeft, constant: leftPadding).isActive = true
        }
        
        if let safeRight = right {
            self.rightAnchor.constraint(equalTo: safeRight, constant: -rightPadding).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
}


//MARK: - UICollectionFlowLayout
extension UICollectionViewFlowLayout {
    open override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
            // Page width used for estimating and calculating paging.
            let pageWidth = itemSize.width + minimumLineSpacing
        
            // Make an estimation of the current page position.
            let approximatePage = collectionView!.contentOffset.x/pageWidth

            // Determine the current page based on velocity.
            let currentPage = (velocity.x < 0.0) ? floor(approximatePage) : ceil(approximatePage)

            // Create custom flickVelocity.
            let flickVelocity = velocity.x * 0.3

            // Check how many pages the user flicked, if <= 1 then flickedPages should return 0.
            let flickedPages = (abs(round(flickVelocity)) <= 1) ? 0 : round(flickVelocity)

            // Calculate newHorizontalOffset.
            let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - self.collectionView!.contentInset.left

            return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
        }
}















