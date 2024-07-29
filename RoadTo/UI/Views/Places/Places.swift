//
//  Places.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 29.07.2024.
//

import Foundation
import UIKit

private let viewModel = PlacesViewModel()

extension PlacesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPlaces
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! PlacesTableViewCell
        
        let placeData = viewModel.placeData(at: indexPath.row)
        
        cell.placeImage.image = UIImage(named: placeData.image ?? "defaultImage") // Varsayılan bir görsel kullanabilirsin
        cell.placeNameLabel.text = placeData.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "PlaceDetailsVC") as? PlaceDetailsVC {
            let placeData = viewModel.placeData(at: indexPath.row)
            
            let placeDetailsViewModel = PlaceDetailsViewModel(tempPlaceName: placeData.name!,
                                                              tempPlaceImage: placeData.image!,
                                                              tempPlaceLocation: placeData.location!,
                                                              tempPlaceStar: placeData.star!)
            vc.viewModel = placeDetailsViewModel
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension PlacesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterPlaces(for: searchText)
        placesTableView.reloadData()
    }
}
