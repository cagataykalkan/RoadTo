//
//  LikedPlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 10.07.2024.
//

import UIKit

class LikedPlacesVC: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var likedPlacesTableView: UITableView!
    

    let dataArray = DataManager.shared.dataArray

    
    var likedPlaces: [PlaceData] {
        return dataArray.filter { $0.liked! }
    }
    
    var searchingLikedPlaces = [PlaceData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLikedPlaces()
        
        startButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsEkstraBold, size: 20)
        startButton.backgroundColor = UIColor(named: K.BrandColors.black3)
        startButton.tintColor = UIColor.white
        startButton.layer.cornerRadius = 25
        
        likedPlacesTableView.dataSource = self
        likedPlacesTableView.delegate = self

        
        self.likedPlacesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.likedPlacesTableView.showsVerticalScrollIndicator = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLikedPlaces()
        
        if likedPlaces.isEmpty {
            performSegue(withIdentifier: K.identifiers.likedToEmpty, sender: self)
        }
    }

    func updateLikedPlaces() {
        likedPlacesTableView.reloadData() // Tabloyu yenilemek için
    }

    
}
extension LikedPlacesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return likedPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < likedPlaces.count else {
            fatalError("Index out of range while accessing likedPlaces")
        }
        
        let cell = likedPlacesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! LikedPlacesTableViewCell
        
        let placeData = likedPlaces[indexPath.row]
        
        cell.placeImage.image = UIImage(named: placeData.image ?? "")
        cell.placeNameLabel.text = placeData.name ?? ""
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard likedPlaces.indices.contains(indexPath.row) else {
            fatalError("Index out of range while accessing likedPlaces")
        }

        
        let selectedPlace = likedPlaces[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(identifier: "PlaceDetailsVC") as? PlaceDetailsVC {
            vc.tempPlaceName = selectedPlace.name!
            vc.tempPlaceImage = selectedPlace.image!
            vc.tempPlaceLocation = selectedPlace.location!
            vc.tempPlaceStar = selectedPlace.star!
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }




}
