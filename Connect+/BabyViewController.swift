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
    //var imageArray = [UIImage(named: "wk_14"), UIImage(named: "wk_15"), UIImage(named: "wk_16"), UIImage(named: "wk_17")]
    var titleArray = ["Week 14", "Week 15", "Week 16", "Week 17"]
    
    var descriptionArray = ["My vital organs have started to develop! How exciting! I’m so much closer to being fully grown! Don’t forget to get a body pillow. As I keep growing, I might start putting more pressure on you.", "My skin remains super thin, allowing developing blood vessels to show right through. My skeleton is starting to ossify. My ears and eyes are moving into place! I'm so excited about it!", "My eyes are making small side-to-side movements this week and can perceive some light, even though they’re still closed! I can't wait to meet you! I can also make thumb-sucking motions!", "This week I'm practicing sucking and swallowing to get ready for the real thing: a breast or bottle! My sense of hearing is also making big strides this week! My ears are close to being fully formed."]
    
    var togoArray = ["26 Weeks To Go!","25 Weeks To Go!","24 Weeks To Go!","23 Weeks To Go!"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.BabyImage.image = imageArray[indexPath.row]
        cell.ImageTitle.text = titleArray[indexPath.row]
        cell.ImageDescription.text = descriptionArray[indexPath.row]
        cell.TogoInfo.text = togoArray[indexPath.row]
        
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
