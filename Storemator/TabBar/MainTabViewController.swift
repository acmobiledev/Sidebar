//
//  MainTabViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
        self.constructTabBarViewControllers()
    }
    
    func constructTabBarViewControllers() {
        //TodayVC
        let todayVC = self.constructNavigationController(selectedImage: #imageLiteral(resourceName: "tabbar_apps"), unSelectedImage: #imageLiteral(resourceName: "tabbar_apps"), rootViewController: TodayViewController())
        //GamesVC
        let gamesVC = self.constructNavigationController(selectedImage: #imageLiteral(resourceName: "tabbar_games"), unSelectedImage: #imageLiteral(resourceName: "tabbar_games"), rootViewController: GamesViewController())
        //UpdatesVC
        let updatesVC = self.constructNavigationController(selectedImage: #imageLiteral(resourceName: "tabbar_updates"), unSelectedImage: #imageLiteral(resourceName: "tabbar_updates"), rootViewController: UpdatesViewController())
        //SearchVC
        let searchVC = self.constructNavigationController(selectedImage: #imageLiteral(resourceName: "tabbar_search"), unSelectedImage: #imageLiteral(resourceName: "tabbar_search"), rootViewController: SearchViewController())
        
        self.viewControllers = [todayVC, gamesVC, updatesVC, searchVC]
    }
    
    func constructNavigationController(selectedImage: UIImage, unSelectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.selectedImage = selectedImage
        navigationController.tabBarItem.image = unSelectedImage
        return navigationController
    }

}
