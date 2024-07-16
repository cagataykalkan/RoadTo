//
//  PlacesViewModel.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 16.07.2024.
//

import Foundation
import UIKit

class PlacesViewModel {
    
    private let dataArray = DataManager.shared.dataArray
    
    var searchingNames: [PlaceData] = []
    var searching = false
    
    var numberOfPlaces: Int {
        return searching ? searchingNames.count : dataArray.count
    }
    
    func placeData(at index: Int) -> PlaceData {
        return searching ? searchingNames[index] : dataArray[index]
    }
    
    func filterPlaces(for searchText: String) {
        if searchText.isEmpty {
            searching = false
        } else {
            searching = true
            searchingNames = dataArray.filter { $0.name!.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func isPlaceLiked(at index: Int) -> Bool {
        return dataArray[index].liked ?? false
    }
    
    func navigateToLikedPlaces(on viewController: UIViewController) {
        let likedPlaces = dataArray.filter { $0.liked ?? false }
        let segueIdentifier = likedPlaces.isEmpty ? K.identifiers.toEmpty : K.identifiers.toLikedPlaces
        viewController.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
