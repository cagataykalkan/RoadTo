//
//  EmptyLikedListVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.07.2024.
//

import UIKit

class EmptyLikedListVC: UIViewController {
    
    @IBOutlet weak var emptyButton: UIButton!
    @IBOutlet weak var emptyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        emptyLabel.textColor = UIColor(named: K.BrandColors.black3)
        emptyLabel.font = UIFont(name: K.Fonts.poppinsSemiBold, size: 50)
        
        emptyButton.backgroundColor = UIColor(named: K.BrandColors.black3)
        emptyButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsEkstraBold, size: 20)
        emptyButton.tintColor = UIColor.white
        emptyButton.layer.cornerRadius = 25


    }
    

    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: K.identifiers.emptyToPlaces, sender: self)
    }
    
}
