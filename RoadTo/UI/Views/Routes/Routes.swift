//
//  Routes.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.08.2024.
//

import Foundation
import UIKit


extension RoutesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfLikedPlaces()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = routesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! RoutesTableViewCell
        let placeData = viewModel.getPlace(at: indexPath.row)
        cell.placeImage.image = UIImage(named: placeData.image ?? "")
        cell.placeNameLabel.text = placeData.name ?? ""
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Hücre yüksekliği
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Tahmini yükseklik
    }

    

    
}
