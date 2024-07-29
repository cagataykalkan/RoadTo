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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI(){
        appleView.layer.borderWidth = 2
        appleView.layer.cornerRadius = 30
        
        googleView.layer.borderWidth = 2
        googleView.layer.cornerRadius = 30
       
        mailView.layer.borderWidth = 2
        mailView.layer.cornerRadius = 30
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
