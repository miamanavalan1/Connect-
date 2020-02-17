//
//  AddTaskViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/17/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func SaveBtnClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
