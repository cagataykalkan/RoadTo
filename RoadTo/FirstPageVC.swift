//
//  FirstPageVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 29.07.2024.
//

import UIKit

class FirstPageVC: UIViewController {
    
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var googleView: UIView!

    @IBOutlet weak var signInWithMailButton: UIButton!
    @IBOutlet weak var signInWithGoogleButton: UIButton!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        setDelegateAndButtonactions()
    }
    func setupUI(){
        appleView.layer.borderWidth = 2
        appleView.layer.cornerRadius = 30
        
        googleView.layer.borderWidth = 2
        googleView.layer.cornerRadius = 30
       
        mailView.layer.borderWidth = 2
        mailView.layer.cornerRadius = 30
    }

    func setDelegateAndButtonactions(){
        signInWithGoogleButton.addTarget(self, action: #selector(signInWithGoogleButtonAction), for: .touchUpInside)
    }
   
    @objc func signInWithGoogleButtonAction(){
        let vc = WelcomeVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        let a = 2
        let b = "iki"
    }
