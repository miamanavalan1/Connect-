//
//  AddTaskViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/17/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddShoppingTaskViewController: UIViewController {

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
        let alertController: UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popViewController(animated: true) })
        alertController = UIAlertController(title: "Success", message: "Task saved", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        //self.navigationController?.popViewController(animated: true)
        
    }
    
}
