//
//  SideBarViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 7/23/21.
//  Copyright © 2021 Amit Chaudhary. All rights reserved.
//

import UIKit

private enum SidebarSection: Int {
    case library
}

class SideBarViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var cvdataSource: UICollectionViewDiffableDataSource<SidebarSection, TabsViewModel>!
    
    public var selectedIndex: Int = 0 {
        didSet {
            // Set the navigation
            if let cv = collectionView {
                cv.selectItem(at: IndexPath(row: self.selectedIndex, section: 0),
                                          animated: false,
                                          scrollPosition: UICollectionView.ScrollPosition.centeredVertically)

            }
            
            // Set the correct view
            if  let t = TabsViewModel.init(rawValue: self.selectedIndex) {
                let nc = UINavigationController(rootViewController: t.primaryViewController)
                self.splitViewController?.showDetailViewController(nc, sender: self)
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    private func commonInit() {
        // Important to set the title during construction instead of viewDidLoad.
        // When iPad starts in portrait mode the SidebarViewController is constructed, but not loaded. Still the title nees to be set for the correct navigation link.
        self.title = "App Store"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureCollectionView()
        configureDataSource()
        
        applyInitialSnapshot()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true

        // Set the initial view controller
        self.selectedIndex = 0
    }
    
    private func configureCollectionViewLayout() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .green
    }

}


extension SideBarViewController {
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGreen
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout() { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
            configuration.showsSeparators = true
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            return section
        }
        return layout
    }
}


extension SideBarViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tab = cvdataSource.itemIdentifier(for: indexPath),
              let splitViewController = self.splitViewController as? SplitViewController
              else { return }
        
        if (indexPath.section == 0) {
            // Remember the tab, so we can sync tabs when going to compact
            splitViewController.tab = indexPath.row
        }
        
        // By default the secondary view has a navigation controller, so when showing a detail it becomes part of the navigation stack.
        // Typically you want a navigation stack per menu, so you must set a new Navigation controller for that the work properly
        let nc = UINavigationController(rootViewController: tab.primaryViewController)
        splitViewController.showDetailViewController(nc, sender: self)
        
    }
}


extension SideBarViewController {
    private func configureDataSource() {
        let rowRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, TabsViewModel> {
            (cell, indexPath, item) in
            
            var content = cell.defaultContentConfiguration()
            content.text = item.name
            content.image = item.image
            
            cell.contentConfiguration = content
        }
        
        cvdataSource = UICollectionViewDiffableDataSource<SidebarSection, TabsViewModel>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell in
                return collectionView.dequeueConfiguredReusableCell(using: rowRegistration, for: indexPath, item: item)
        }
    }
    
    private func librarySnapshot() -> NSDiffableDataSourceSectionSnapshot<TabsViewModel> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<TabsViewModel>()
        snapshot.append(TabsViewModel.allCases)

        return snapshot
    }

    private func applyInitialSnapshot() {
        cvdataSource.apply(librarySnapshot(), to: .library, animatingDifferences: false)
    }

}
