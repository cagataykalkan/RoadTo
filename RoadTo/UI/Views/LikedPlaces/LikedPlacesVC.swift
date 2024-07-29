//
//  LikedPlacesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 10.07.2024.
//

import UIKit

class LikedPlacesVC: UIViewController{
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var likedPlacesTableView: UITableView!
    
    let viewModel = LikedPlacesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedPlacesTableView.dataSource = self
        likedPlacesTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        likedPlacesTableView.reloadData()
        
        if viewModel.numberOfLikedPlaces() == 0 {
            performSegue(withIdentifier: K.identifiers.likedToEmpty, sender: self)
        }
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.identifiers.likedToRoutes, sender: self)
    }
    

}
