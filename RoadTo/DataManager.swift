//
//  DataManager.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.07.2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var dataArray: [PlaceData] = [
        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true, location: "Pamukkale, Denizli", star: 4.3),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: false, location: "Pamukkale, Denizli", star: 4.4),
        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false, location: "Merkez, Denizli", star: 4.2),
        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false, location: "Pamukkale, Denizli", star: 4.1),
        PlaceData(image: "mağara", name: "MAĞARA", liked: false, location: "Kaklık,  Denizli", star: 3.7),
        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: false, location: "Pamukkale, Denizli", star: 4.0)
    ]
    
    private init() {}
}

