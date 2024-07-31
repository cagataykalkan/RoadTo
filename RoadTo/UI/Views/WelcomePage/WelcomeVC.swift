//
//  WelcomeVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 30.07.2024.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startExploringLabel: UILabel!
    @IBOutlet weak var userProfilePhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = UIColor(named: K.BrandColors.yellow)
        
        userProfilePhoto.layer.cornerRadius = 40
        
        welcomeLabel.textColor = UIColor(named: K.BrandColors.black)
        welcomeLabel.font = UIFont(name: K.Fonts.poppinsBold, size: 32)
        welcomeLabel.text = "Hoşgeldin Çağatay👋"
        
        startExploringLabel.textColor = UIColor(named: K.BrandColors.grey)
        startExploringLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        startExploringLabel.text = "KEŞFETMEYE BAŞLA"
    }
   
}
