//
//  RegisterVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 1.08.2024.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
  
    }
  
    private func setupUI(){
        welcomeLabel.text = "RoadTo? üyesi olun."
        welcomeLabel.textColor = UIColor(named: K.BrandColors.black3)
        welcomeLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        
        emailLabel.text = "E-posta adresi"
        emailLabel.textColor = UIColor(named: K.BrandColors.black2)
        emailLabel.font = UIFont(name: K.Fonts.poppinsRegular, size: 16)
        
        passwordLabel.text = "Parola"
        passwordLabel.textColor = UIColor(named: K.BrandColors.black2)
        passwordLabel.font = UIFont(name: K.Fonts.poppinsRegular, size: 16)
        
        registerButton.backgroundColor = .black
        registerButton.tintColor = .white
        registerButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsRegular, size: 16)
        registerButton.layer.cornerRadius = 20
         
        loginButton.backgroundColor = .white
        loginButton.tintColor = .black
        loginButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsRegular, size: 16)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.black.cgColor

    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        if let email = emailTextField.text , let password = passwordTextField.text{
                   Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                       if let e = error{
                           print(e.localizedDescription)
                       }else{
                           self.performSegue(withIdentifier: K.identifiers.registerToWelcome, sender: self)
                       }
                       
                   }
               }
    }

}
