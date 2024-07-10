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
    
    let dataArray:[PlaceData] = [
        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: true),
        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false),
        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false),
        PlaceData(image: "mağara", name: "MAĞARA", liked: true),
        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: true)
    ]
    
    var likedPlaces: [PlaceData] {
        return dataArray.filter { $0.liked! }
    }
    
    var searchingLikedPlaces = [PlaceData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsEkstraBold, size: 20)
        startButton.backgroundColor = UIColor(named: K.BrandColors.black3)
        startButton.tintColor = UIColor.white
        startButton.layer.cornerRadius = 25
        
        likedPlacesTableView.dataSource = self
        likedPlacesTableView.delegate = self

        
        self.likedPlacesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.likedPlacesTableView.showsVerticalScrollIndicator = false
    }
    
}
extension LikedPlacesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return likedPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = likedPlacesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! LikedPlacesTableViewCell
               
        let placeData: PlaceData
        placeData = likedPlaces[indexPath.row]
    
        cell.placeImage.image = UIImage(named: placeData.image!)
        cell.placeNameLabel.text = placeData.name
               
        return cell
    }

}
