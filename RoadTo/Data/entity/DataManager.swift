//
//  DataManager.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.07.2024.
//

import Foundation
import GRDB

class DataManager {
    static let shared = DataManager()
    
    private(set) var places: [PlaceData] = []
    private var dbQueue: DatabaseQueue?
    
    private init() {
        do {
            dbQueue = try getDatabaseQueue()
            loadAllData()
        } catch {
            print("Veritabanı hatası: \(error)")
        }
    }
    
    private func getDatabaseQueue() throws -> DatabaseQueue {
        let fileManager = FileManager.default
        let dbPath = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("RoadTo.db").path
        
        // Eğer veritabanı dosyası mevcutsa, eski dosyayı sil
        if fileManager.fileExists(atPath: dbPath) {
            try fileManager.removeItem(atPath: dbPath)
        }
        
        // Yeni veritabanı dosyasını kopyala
        if let dbResourcePath = Bundle.main.path(forResource: "RoadTo", ofType: "db") {
            try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
        } else {
            throw NSError(domain: "Veritabanı dosyası bulunamadı", code: 1, userInfo: nil)
        }
        
        return try DatabaseQueue(path: dbPath)
    }

    private func loadAllData() {
        places = []
        
        do {
            try dbQueue?.read { db in
                let rows = try Row.fetchAll(db, sql: "SELECT name, image, liked, location, star FROM Places ORDER BY id")
                
                for row in rows {
                    places.append(PlaceData(image: row["image"], name: row["name"], liked: row["liked"], location: row["location"], star: row["star"]))
                }
            }
        } catch {
            print("Veri yükleme hatası: \(error)")
        }
    }

    
    //    static let shared = DataManager()
    //
    //    var dataArray: [PlaceData] = [
    //        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true, location: "Pamukkale, Denizli", star: 4.3, x: 37.92430624042704, y: 29.123151866303782),
    //        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: false, location: "Pamukkale, Denizli", star: 4.4, x: 37.927011830835276, y:29.12950740602874),
    //        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false, location: "Merkez, Denizli", star: 4.2, x:37.773562179246674, y:29.08723929883948),
    //        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false, location: "Pamukkale, Denizli", star: 4.1, x: 37.836937155883064, y:29.108737781644667),
    //        PlaceData(image: "mağara", name: "MAĞARA", liked: false, location: "Kaklık,  Denizli", star: 3.7, x:37.388076888724314, y:29.500144827659867),
    //        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: false, location: "Pamukkale, Denizli", star: 4.0, x:37.92644707571621, y:29.125456539094245)
    //    ]
    //
    //    private init() {}
}

