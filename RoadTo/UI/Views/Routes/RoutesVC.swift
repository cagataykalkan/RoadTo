//
//  RoutesVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.08.2024.
//

import UIKit

class RoutesVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var routesTableView: UITableView!
    
    let viewModel = RoutesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        routesTableView.dataSource = self
        routesTableView.delegate = self
        
        setupUI()
    }
    

    func setupUI(){
        headerLabel.text = "Size en uygun yolu seçin"
        headerLabel.textColor = UIColor(named: K.BrandColors.purple)
        headerLabel.font = UIFont(name: K.Fonts.poppinsSemiBold, size: 30)
        
        background.backgroundColor = UIColor(named: K.BrandColors.purple)
        background.layer.cornerRadius = 25
        
        routesTableView.backgroundColor = .clear
        //routesTableView.rowHeight = 130
        
        
        
    }


}
