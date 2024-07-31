//
//  PlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 9.07.2024.
//

import UIKit

class PlacesVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var placesTableView: UITableView!
    
    private let viewModel = PlacesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        placesTableView.reloadData()  // Yalnızca veriler `DataManager` tarafından yüklenecek
    }
    
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(navBarButtonTapped))
        
        placesTableView.dataSource = self
        placesTableView.delegate = self
        placesTableView.separatorStyle = .none
        placesTableView.showsVerticalScrollIndicator = false
        
        searchBar.delegate = self
    }
    
    @objc private func navBarButtonTapped() {
        viewModel.navigateToLikedPlaces(on: self)
    }
}

