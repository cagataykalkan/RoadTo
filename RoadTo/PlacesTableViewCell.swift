//
//  PlacesTableViewCell.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 9.07.2024.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        placeNameLabel.font = UIFont(name: K.Fonts.poppinsBlack, size: 48)
        placeNameLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
