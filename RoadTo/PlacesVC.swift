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
        PlaceData(image: "Pamukkale", name: "PAMUKKALE", liked: true),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS",liked: true),
        PlaceData(image: "horoz heykeli", name: "HOROZ",liked: false),
        PlaceData(image: "leodikya", name: "LEODIKYA", liked: false),
        PlaceData(image: "mağara", name: "MAĞARA", liked: true),
        PlaceData(image: "antik havuz", name: "KLEOPATRA HAVUZU", liked: true)
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
        if searching {
            return searchingNames.count
        } else {
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! PlacesTableViewCell
        
        let placeData: PlaceData
        
        if searching {
            placeData = searchingNames[indexPath.row]
        } else {
            placeData = dataArray[indexPath.row]
        }
        
        cell.placeImage.image = UIImage(named: placeData.image!)
        cell.placeNameLabel.text = placeData.name
        
        return cell
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
