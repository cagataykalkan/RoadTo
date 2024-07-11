//
//  PlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 9.07.2024.
//

import UIKit

class PlacesVC: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var placesTableView: UITableView!
    
    let dataArray:[PlaceData] = [
        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true, location: "Pamukkale, Denizli", star: 4.3),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: true, location: "Pamukkale, Denizli", star: 4.4),
        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false, location: "Merkez, Denizli", star: 4.2),
        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false, location: "Pamukkale, Denizli", star: 4.1),
        PlaceData(image: "mağara", name: "MAĞARA", liked: true, location: "Kaklık,  Denizli", star: 3.7),
        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: true, location: "Pamukkale, Denizli", star: 4.0)
    ]
    
    var searchingNames = [PlaceData]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(navBarButtonTapped))
        
        placesTableView.dataSource = self
        placesTableView.delegate = self
        
        
        self.placesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.placesTableView.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
    }
    
    
    @objc private func navBarButtonTapped(){
        performSegue(withIdentifier: K.identifiers.toLikedPlaces, sender: self)
    }
    
    
}
extension PlacesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? searchingNames.count : dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! PlacesTableViewCell
        
        let placeData: PlaceData = searching ? searchingNames[indexPath.row] : dataArray[indexPath.row]
        
        cell.placeImage.image = UIImage(named: placeData.image!)
        cell.placeNameLabel.text = placeData.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "PlaceDetailsVC") as? PlaceDetailsVC{
            //vc.placeImage =  dataArray[indexPath.row].image
            vc.tempPlaceName = dataArray[indexPath.row].name!
            vc.tempPlaceImage = dataArray[indexPath.row].image!
            vc.tempPlaceLocation = dataArray[indexPath.row].location!
            vc.tempPlaceStar = dataArray[indexPath.row].star!
            
            self.navigationController?.pushViewController(vc, animated: true )
        }
    }
}
extension PlacesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searching = false
        } else {
            searching = true
            searchingNames = dataArray.filter { $0.name!.lowercased().contains(searchText.lowercased()) }
        }
        placesTableView.reloadData()
    }
}
