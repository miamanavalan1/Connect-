//
//  BabyViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/16/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class BabyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var imageArray = [UIImage(named: "pregnant 1"), UIImage(named: "pregnant 2"), UIImage(named: "pregnant 2"), UIImage(named: "pregnant 1")]
    var titleArray = ["Day 40", "Day 41", "Day 42", "Day 43"]
    
    var descriptionArray = ["My vital organs have started to develop! How exciting! I’m so much closer to being fully grown! Don’t forget to get a body pillow. As I keep growing, I might start putting more pressure on you.", "My vital organs have started to develop! How exciting! I’m so much closer to being fully grown! Don’t forget to get a body pillow. As I keep growing, I might start putting more pressure on you.", "My vital organs have started to develop! How exciting! I’m so much closer to being fully grown! Don’t forget to get a body pillow. As I keep growing, I might start putting more pressure on you.", "My vital organs have started to develop! How exciting! I’m so much closer to being fully grown! Don’t forget to get a body pillow. As I keep growing, I might start putting more pressure on you."]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.BabyImage.image = imageArray[indexPath.row]
        cell.ImageTitle.text = titleArray[indexPath.row]
        cell.ImageDescription.text = descriptionArray[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 20.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)
        cell.contentView.layer.masksToBounds = false;
        cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)

        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 10.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
