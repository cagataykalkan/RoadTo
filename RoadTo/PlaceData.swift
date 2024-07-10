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
    
    init(image: String, name: String, liked: Bool) {
        self.image = image
        self.name = name
        self.liked = liked
    }
    
    init(){
        
    }
}


