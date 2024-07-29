//
//  welcome.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 29.07.2024.
//

import Foundation
import UIKit

extension WelcomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
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
