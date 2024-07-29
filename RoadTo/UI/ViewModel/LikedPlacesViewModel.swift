//
//  LikedPlacesViewModel.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 16.07.2024.
//

import Foundation
import UIKit

class LikedPlacesViewModel {
    private let places = DataManager.shared.places
    
    var likedPlaces: [PlaceData] {
        return places.filter { $0.liked ?? false }
    }
    
    func numberOfLikedPlaces() -> Int {
        return likedPlaces.count
    }
    
    func getPlace(at index: Int) -> PlaceData {
        return likedPlaces[index]
    }
    
    func navigateToPlaceDetails(at index: Int, navigationController: UINavigationController?) {
        let selectedPlace = likedPlaces[index]
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlaceDetailsVC") as? PlaceDetailsVC {
            let placeDetailsViewModel = PlaceDetailsViewModel(tempPlaceName: selectedPlace.name!,
                                                              tempPlaceImage: selectedPlace.image!,
                                                              tempPlaceLocation: selectedPlace.location!,
                                                              tempPlaceStar: selectedPlace.star!)
            vc.viewModel = placeDetailsViewModel
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
