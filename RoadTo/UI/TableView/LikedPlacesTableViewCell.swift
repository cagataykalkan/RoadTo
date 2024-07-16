//
//  LikedPlacesTableViewCell.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 10.07.2024.
//

import UIKit

class LikedPlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        placeNameLabel.font = UIFont(name: K.Fonts.poppinsBlack, size: 48)
        placeNameLabel.textColor = UIColor.white
        
        placeImage.layer.cornerRadius = 30
        shadowImage.layer.cornerRadius = 30
        
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
