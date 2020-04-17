//
//  BabyViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/16/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class BabyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageArray = [UIImage(named: "pregnant 1"), UIImage(named: "pregnant 2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.BabyImage.image = imageArray[indexPath.row]
        return cell
    } 
    
}
