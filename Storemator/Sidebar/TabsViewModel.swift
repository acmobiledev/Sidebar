//
//  TabsViewModel.swift
//  Storemator
//
//  Created by Amit Chaudhary on 7/23/21.
//  Copyright © 2021 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

enum TabsViewModel: Int, CaseIterable {
    case games
    case today
    case updates
    case search
    
    var image: UIImage? {
        switch self {
        case .games:
            return UIImage(systemName: "gamecontroller.fill")
        case .today:
            return UIImage(systemName: "timer.square")
        case .updates:
            return UIImage(systemName: "circle.dashed.inset.fill")
        case .search:
            return UIImage(systemName: "magnifyingglass.circle.fill")
        }
    }
    
    var name: String {
        switch self {
        case .games:
            return NSLocalizedString("Games", comment: "")
        case .today:
            return NSLocalizedString("Today", comment: "")
        case .updates:
            return NSLocalizedString("Updates", comment: "")
        case .search:
            return NSLocalizedString("Search", comment: "")
        }
    }
    
    var primaryViewController: UIViewController {
        switch self {
        case .games:
            return GamesViewController()
        case .today:
            return TodayViewController()
        case .search:
            return SearchViewController()
        case .updates:
            return UpdatesViewController()
        }
    }
    
    
}
