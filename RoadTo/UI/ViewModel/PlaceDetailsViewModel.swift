//
//  PlaceDetailsViewModel.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 16.07.2024.
//

import Foundation
import UIKit

class PlaceDetailsViewModel {
    private let places = DataManager.shared.places
    var tempPlaceName: String
    var tempPlaceImage: String
    var tempPlaceLocation: String
    var tempPlaceStar: Double
    var likeButtonImagesIndex = 0
    let likeButtonImages = ["unlikedIcon", "likedIcon"]
    
    init(tempPlaceName: String, tempPlaceImage: String, tempPlaceLocation: String, tempPlaceStar: Double) {
        self.tempPlaceName = tempPlaceName
        self.tempPlaceImage = tempPlaceImage
        self.tempPlaceLocation = tempPlaceLocation
        self.tempPlaceStar = tempPlaceStar
        setupLikeButtonIndex()
    }
    
    private func setupLikeButtonIndex() {
        if let place = places.first(where: { $0.name == tempPlaceName }) {
            likeButtonImagesIndex = place.liked ?? false ? 1 : 0
        }
    }
    
    func toggleLikeStatus() {
        likeButtonImagesIndex = (likeButtonImagesIndex + 1) % likeButtonImages.count
        if let index = places.firstIndex(where: { $0.name == tempPlaceName }) {
            places[index].liked = (likeButtonImagesIndex == 1)
        }
    }
    
    func getLikeButtonImage() -> UIImage? {
        return UIImage(named: likeButtonImages[likeButtonImagesIndex])
    }
}
