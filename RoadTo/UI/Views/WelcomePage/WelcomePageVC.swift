//
//  ViewController.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 24.06.2024.
//

import UIKit

class WelcomePageVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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

        starTimer()
        
        setupUI()
    }
    
    private func setupUI(){
        navigationItem.hidesBackButton = true
        
        userProfilePhotoImage.layer.cornerRadius = 40


        startExploreLabel.textColor = UIColor(named: K.BrandColors.grey)
        startExploreLabel.font = UIFont(name: K.Fonts.poppinsMedium, size: 22)
        startExploreLabel.text = "KEŞFETMEYE BAŞLA"
                
        welcomeLabel.textColor = UIColor(named: K.BrandColors.black)
        welcomeLabel.font = UIFont(name: K.Fonts.poppinsBold, size: 32)
        welcomeLabel.text = "Hoşgeldin Çağatay👋"
        

        
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
        self.view.backgroundColor = UIColor(named: K.BrandColors.yellow)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SliderImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: K.identifiers.sliderCell, for: indexPath) as! SliderCollectionViewCell
        
        cell.sliderImage.image = UIImage(named: SliderImageArray[indexPath.row ])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: sliderCollectionView.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        150 //minimumLineSpacingForSectionAt: aralardaki boşlukları ayarlar
    }
}
