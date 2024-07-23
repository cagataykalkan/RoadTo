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
        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true, location: "Pamukkale, Denizli", star: 4.3, x: 37.92430624042704, y: 29.123151866303782),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: false, location: "Pamukkale, Denizli", star: 4.4, x: 37.927011830835276, y:29.12950740602874),
        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false, location: "Merkez, Denizli", star: 4.2, x:37.773562179246674, y:29.08723929883948),
        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false, location: "Pamukkale, Denizli", star: 4.1, x: 37.836937155883064, y:29.108737781644667),
        PlaceData(image: "mağara", name: "MAĞARA", liked: false, location: "Kaklık,  Denizli", star: 3.7, x:37.388076888724314, y:29.500144827659867),
        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: false, location: "Pamukkale, Denizli", star: 4.0, x:37.92644707571621, y:29.125456539094245)
    ]
    
    private init() {}
}

