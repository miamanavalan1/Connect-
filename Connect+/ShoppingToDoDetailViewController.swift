//
//  ShoppingToDoDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/30/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class ShoppingToDoDetailViewController: UIViewController {
    var deadline = "Jan 20, 2020"
    var content = ""
    var showddl: UILabel!
    var showcontent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        content = "Eggs\n"+"Butter\n"+"Bread\n"+"Milk"
        
        showddl = UILabel(frame: CGRect(x: 32, y: 606, width: 278, height: 27))
        showddl.text = "By " + deadline
        showddl.font = UIFont(name: "Assistant-Bold", size: 20.0)
        showddl.textColor = UIColor.black
        showddl.textAlignment = .left
        
        showcontent = UILabel(frame: CGRect(x: 32, y: 638, width: 362, height: 135))
        showcontent.numberOfLines = 0
        showcontent.text = content
        showcontent.font = UIFont(name: "Assistant-Regular", size: 20)
        showcontent.textColor = UIColor.black
        showcontent.sizeToFit()
        
        self.view.addSubview(showddl)
        self.view.addSubview(showcontent)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
