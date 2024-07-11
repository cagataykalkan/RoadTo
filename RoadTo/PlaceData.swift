//
//  PlaceData.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 9.07.2024.
//

import Foundation

class PlaceData{
    var image: String?
    var name: String?
    var liked: Bool?
    var location: String?
    var star: Double?
    var suitabilityForFamily: Bool?
    var suitabilityForBaby: Bool?
    var valueOfTimeToSpend: String?
    var about: String?
    
    init(image: String, name: String, liked: Bool, location: String, star: Double) {
        self.image = image
        self.name = name
        self.liked = liked
        self.location = location
        self.star = star
    }
    
    init(image: String, name: String, liked: Bool) {
        self.image = image
        self.name = name
        self.liked = liked
    }
    
    init(image: String, name: String, liked: Bool, location: String, star: Double, suitabilityForFamily: Bool, suitabilityForBaby: Bool, valueOfTimeToSpend: String, about: String) {
        self.image = image
        self.name = name
        self.liked = liked
        self.location = location
        self.star = star
        self.suitabilityForFamily = suitabilityForFamily
        self.suitabilityForBaby = suitabilityForBaby
        self.valueOfTimeToSpend = valueOfTimeToSpend
        self.about = about
    }
    
    init(){
        
    }
}


