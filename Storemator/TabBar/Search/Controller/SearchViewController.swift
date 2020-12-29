//
//  SearchViewController.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

fileprivate let appStoreSearch: [AppStoreSearch] = [AppStoreSearch(text: "weChat"), AppStoreSearch(text: "weibo"), AppStoreSearch(text: "Zynga"), AppStoreSearch(text: "Pokeman Go"), AppStoreSearch(text: "Polar Bear"), AppStoreSearch(text: "Threes"), AppStoreSearch(text: "Alto's Adventure"), AppStoreSearch(text: "Pixelmator"), AppStoreSearch(text: "Youtube"), AppStoreSearch(text: "Snapchat"), AppStoreSearch(text: "Facebook"), AppStoreSearch(text: "Netflix")]

class SearchViewController: UITableViewController {
    
    var filteredSearch: [AppStoreSearch] = []
    
    lazy var searchController: UISearchController = {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchBar.autocapitalizationType = .none
        searchVC.searchBar.placeholder = "App Store"
        searchVC.isActive = true
        definesPresentationContext = true
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchResultsUpdater = self
        return searchVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView.register(SearchViewCell.self, forCellReuseIdentifier: "SearchCell")
        self.setupSearchController()
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Search"
    }
}


//MARK: - TVDelegate, TVDataSource
extension SearchViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.searchBar.text!.isEmpty && !searchController.isActive {
            return appStoreSearch.count
        } else {
            return filteredSearch.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchViewCell
        if searchController.searchBar.text!.isEmpty && !searchController.isActive {
            cell.textLabel?.text = appStoreSearch[indexPath.row].text
        } else {
            cell.textLabel?.text = filteredSearch[indexPath.row].text
        }
        return cell
    }
}


//MARK: - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredSearch = appStoreSearch.filter { (appStoreSearch: AppStoreSearch) -> Bool in
            return appStoreSearch.text.lowercased().contains(searchText.lowercased())
        }
        self.tableView.reloadData()
    }
}
