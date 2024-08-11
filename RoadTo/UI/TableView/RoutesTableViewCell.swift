//
//  RoutesTableViewCell.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 12.08.2024.
//

import UIKit

class RoutesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI(){
        placeNameLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        placeNameLabel.textColor = UIColor.white
    
        backgroundColor = UIColor(named: K.BrandColors.lightPurple)
        layer.cornerRadius = 5
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
