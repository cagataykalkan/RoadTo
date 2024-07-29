//
//  LikedPlaces.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 29.07.2024.
//

import Foundation
import UIKit

extension LikedPlacesVC: UITableViewDelegate, UITableViewDataSource{
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
