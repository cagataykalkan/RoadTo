//
//  LoginVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 31.07.2024.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var welcomeLabel2: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        welcomeLabel.text = "Sizi tekrar görmek çok güzel,"
        welcomeLabel.textColor = UIColor(named: K.BrandColors.black3)
        welcomeLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
    }
    
}
