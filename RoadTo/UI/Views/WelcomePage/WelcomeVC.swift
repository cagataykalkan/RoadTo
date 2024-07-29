//
//  ViewController.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 24.06.2024.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startExploreLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userProfilePhotoImage: UIImageView!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    let SliderImageArray = ["Pamukkale","horoz heykeli","hierapolis" ]
    
    var timer:Timer?
    var CurrentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        starTimer()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(named: K.BrandColors.yellow)
        
        welcomeLabel.textColor = UIColor(named: K.BrandColors.black)
        welcomeLabel.font = UIFont(name: K.Fonts.poppinsBold, size: 32)
        welcomeLabel.text = "Hoşgeldin Çağatay👋"
        
        startExploreLabel.textColor = UIColor(named: K.BrandColors.grey)
        startExploreLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        startExploreLabel.text = "KEŞFETMEYE BAŞLA"
        
        userProfilePhotoImage.layer.cornerRadius = 40
        
        startButton.backgroundColor = UIColor(named: K.BrandColors.purple)
        startButton.tintColor = UIColor(named: K.BrandColors.lightPurple)
        startButton.layer.cornerRadius = 25
        startButton.titleLabel?.font = UIFont(name: K.Fonts.poppinsRegular, size: 18)
        
        self.sliderCollectionView.backgroundColor = UIColor.white
        
        pageController.pageIndicatorTintColor = UIColor(named: K.BrandColors.grey)
        pageController.backgroundColor = UIColor(named: K.BrandColors.lightGrey)
        
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        pageController.numberOfPages = SliderImageArray.count
        
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        //performSegue(withIdentifier: "welcomeToPlaces", sender: self)
    }
    
    
    func starTimer( ){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(cityToIndex), userInfo: nil, repeats: true)
    }
    
    @objc func cityToIndex( ){
        if CurrentIndex == SliderImageArray.count - 1 {
            CurrentIndex = -1
        }else{
            CurrentIndex += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: CurrentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageController.currentPage = CurrentIndex
        }
    }
    
}

