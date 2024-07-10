//
//  PlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 9.07.2024.
//

import UIKit

class PlacesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var placesTableView: UITableView!
    
    let dataArray:[PlaceData] = [
        PlaceData(image: "Pamukkale", name: "PAMUKKALE"),
        PlaceData(image: "hierapolis", name: "HIERAPOLIS"),
        PlaceData(image: "horoz heykeli", name: "HOROZ")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTableView.dataSource = self
        placesTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placesTableView.dequeueReusableCell(withIdentifier: K.identifiers.placesCell, for: indexPath) as! PlacesTableViewCell
        
        cell.placeImage.image = UIImage(named: dataArray[indexPath.row].image!)
        cell.placeNameLabel.text = dataArray[indexPath.row].name
        
        return cell
    }

}
