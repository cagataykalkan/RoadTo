//
//  LikedPlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 10.07.2024.
//

import UIKit

class LikedPlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var likedPlacesTableView: UITableView!
    
    let viewModel = LikedPlacesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedPlacesTableView.dataSource = self
        likedPlacesTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        likedPlacesTableView.reloadData()
        
        if viewModel.numberOfLikedPlaces() == 0 {
            performSegue(withIdentifier: K.identifiers.likedToEmpty, sender: self)
        }
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.identifiers.likedToRoutes, sender: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfLikedPlaces()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = likedPlacesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! LikedPlacesTableViewCell
        let placeData = viewModel.getPlace(at: indexPath.row)
        cell.placeImage.image = UIImage(named: placeData.image ?? "")
        cell.placeNameLabel.text = placeData.name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.likedPlaces.indices.contains(indexPath.row) else {
            fatalError("Index out of range while accessing likedPlaces")
        }
        
        viewModel.navigateToPlaceDetails(at: indexPath.row, navigationController: navigationController)
    }
}
