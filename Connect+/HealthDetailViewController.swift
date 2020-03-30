//
//  HealthDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class HealthDetailViewController: UIViewController {
    var healthname = ""
    var healthdetail = ""
    var addedtime = ""
    var showhealthdetail: UILabel!
    @IBOutlet weak var showhealthname: UILabel!
    @IBOutlet weak var showaddedtime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showhealthname.text = healthname
        
        addedtime = "Mar 30, 2020"
        showaddedtime.text = "Added at " + addedtime
        
        healthdetail = "health details"
        
        showhealthdetail = UILabel(frame: CGRect(x: 37, y: 322, width: 342, height: 293))
        showhealthdetail.text = healthdetail
        showhealthdetail.textColor = UIColor.black
        showhealthdetail.font = UIFont(name: "Assistant-Regular", size: 20.0)
        showhealthdetail.sizeToFit()
        
        self.view.addSubview(showhealthdetail)
        
        // Do any additional setup after loading the view.
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
