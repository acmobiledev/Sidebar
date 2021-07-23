//
//  SplitViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 7/23/21.
//  Copyright © 2021 Amit Chaudhary. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {
    
    var tab = 0
    
    init() {
        super.init(style: .doubleColumn)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
   private func commonInit() {
        preferredDisplayMode = .automatic
        preferredSplitBehavior = .automatic
                
        self.setViewController(SideBarViewController(), for: .primary)
        
        // Important to set the secondary view controller to a default, because starting iPad in portrait does need it before showing the sidebar
    self.setViewController( UINavigationController(rootViewController: TabsViewModel.games.primaryViewController), for: .secondary)

        self.setViewController(MainTabViewController(), for: .compact)
        
        super.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SplitViewController: UISplitViewControllerDelegate {
    
    func splitViewControllerDidExpand(_ svc: UISplitViewController) {
        print("Did expanddddd")

        // Must do this on the Main queue outside of the delegate process, try without you will learn
        DispatchQueue.main.async {
            if let sbc = svc.viewController(for: .primary) as? SideBarViewController {
                sbc.selectedIndex = self.tab
            }
        }
        
    }
    
    func splitViewControllerDidCollapse(_ svc: UISplitViewController) {
        print("Did collapse")

        DispatchQueue.main.async {
            if let tbc = svc.viewController(for: .compact) as? MainTabViewController {
                tbc.selectedIndex = self.tab
            }
        }
    }

}
