//
//  PlaceDetailsVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 10.07.2024.
//

import UIKit

class PlaceDetailsVC: UIViewController {
    
    //scrollview
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutHeaderLabel: UILabel!
    //buttons
    @IBOutlet weak var likeButton: UIButton!
    let likeButtonImages = ["unlikedIcon","likedIcon"]
    var likeButtonImagesIndex = 0
    @IBOutlet weak var backButton: UIButton!
    //shadow
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeStarLabel: UILabel!
    @IBOutlet weak var shadowImage: UIImageView!
    //image
    @IBOutlet weak var placeImage: UIImageView!
    //stackview
    @IBOutlet weak var valueOfTimeToSpend: UILabel!
    @IBOutlet weak var suitabilityForBabyCheck: UILabel!
    @IBOutlet weak var suitabilityForFamilyCheck: UILabel!
    @IBOutlet weak var timeToSpend: UILabel!
    @IBOutlet weak var suitabilityForBaby: UILabel!
    @IBOutlet weak var suitabilityForFamily: UILabel!
    
    let dataArray = DataManager.shared.dataArray
    
    var tempPlaceName = ""
    var tempPlaceImage = ""
    var tempPlaceLocation = ""
    var tempPlaceStar = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        placeNameLabel.text = tempPlaceName
        placeImage.image = UIImage(named: tempPlaceImage)
        placeStarLabel.text = "\(tempPlaceStar)"
        placeLocationLabel.text = tempPlaceLocation
        
        aboutHeaderLabel.text = "Hakkında"
        aboutHeaderLabel.textColor = UIColor(named: K.BrandColors.grey2)
        aboutHeaderLabel.font = UIFont(name: K.Fonts.poppinsSemiBold, size: 18)
        
        aboutLabel.text = "Pamukkale'nin travertenleri, yer altından çıkan kalsiyum karbonat açısından zengin termal suların yüzeye çıkıp buharlaşmasıyla oluşur. Bu süreçte, kalsiyum karbonat tortuları birikir ve zamanla sertleşerek beyaz, basamaklı teraslar meydana getirir. Bu travertenler, Pamukkale'ye özgü görsel bir şölen sunar ve bölgenin adını da buradan alır (\"Pamuk Kale\" yani \"Pamuk Kalesi\"). Pamukkale, 1988 yılında UNESCO Dünya Mirası Listesi'ne dahil edilmiştir ve doğal güzellikleri ile her yıl milyonlarca ziyaretçi çekmektedir. Ziyaretçiler, travertenler üzerinde çıplak ayakla yürüyerek bu eşsiz doğa oluşumunu yakından deneyimleyebilirler."
        aboutLabel.textColor = UIColor(named: K.BrandColors.grey)
        aboutLabel.font = UIFont(name: K.Fonts.poppinsRegular, size: 14)
        
        backButton.layer.cornerRadius = 20
        backButton.alpha = 0.85
        
        likeButton.layer.cornerRadius = 20
        likeButton.alpha = 0.85
        
        shadowImage.alpha = 0.6
        shadowImage.layer.cornerRadius = 20
        
        placeImage.layer.cornerRadius = 20
        
        
        placeNameLabel.textColor = UIColor(named: K.BrandColors.white)
        placeNameLabel.font = UIFont(name: K.Fonts.poppinsSemiBold, size: 24)
        
        
        placeLocationLabel.font = UIFont(name: K.Fonts.poppinsRegular, size: 18)
        placeLocationLabel.textColor = UIColor(named: K.BrandColors.grey3)
        
        
        placeStarLabel.textColor = UIColor(named: K.BrandColors.grey3)
        placeStarLabel.font = UIFont(name: K.Fonts.poppinsRegular, size: 18)
        
        
        suitabilityForFamily.layer.cornerRadius = 12.5
        suitabilityForFamily.layer.masksToBounds = true
        
        suitabilityForBaby.layer.cornerRadius = 12.5
        suitabilityForBaby.layer.masksToBounds = true
        
        timeToSpend.layer.cornerRadius = 12.5
        timeToSpend.layer.masksToBounds = true
        valueOfTimeToSpend.font = UIFont(name: K.Fonts.poppinsRegular, size: 14)
        valueOfTimeToSpend.textColor = UIColor(named: K.BrandColors.grey)
        
        
        // Başlangıçta likeButton resmini ayarla
        if let place = dataArray.first(where: { $0.name == tempPlaceName }) {
            likeButtonImagesIndex = place.liked! ? 1 : 0
            likeButton.setImage(UIImage(named: likeButtonImages[likeButtonImagesIndex]), for: .normal)
        }
        
    }
    
    
    @IBAction func likeButtonPredded(_ sender: Any) {
        likeButtonImagesIndex = (likeButtonImagesIndex + 1) % likeButtonImages.count
        likeButton.setImage(UIImage(named: likeButtonImages[likeButtonImagesIndex]), for: .normal)
        
        if let index = dataArray.firstIndex(where: { $0.name == tempPlaceName }) {
            dataArray[index].liked = (likeButtonImagesIndex == 1)
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
