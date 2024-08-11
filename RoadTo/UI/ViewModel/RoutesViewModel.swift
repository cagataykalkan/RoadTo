//
//  RoutesViewModel.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 22.07.2024.
//

import Foundation
import UIKit

class RoutesViewModel: UITableViewCell{
    
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
    
}
