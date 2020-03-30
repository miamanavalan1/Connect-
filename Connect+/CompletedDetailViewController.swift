//
//  CompletedDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/30/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class CompletedDetailViewController: UIViewController {
    var taskname = ""
    var finishtime = ""
    
    @IBOutlet weak var showtaskname: UITextField!
    @IBOutlet weak var showfinishtime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        finishtime = "Feb 3, 2020"
        showtaskname.text = taskname
        
        showfinishtime.text = "Completed on " + finishtime
        
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
