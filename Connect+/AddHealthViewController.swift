//
//  HealthDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddHealthViewController: UIViewController {

    
    @IBOutlet weak var HealthName: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        HealthName.text = name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveBtnClicked(_ sender: Any) {
        let alertController: UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            if let viewControllers = self.navigationController?.viewControllers {
                self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
            }
        })
        alertController = UIAlertController(title: "Success", message: "Health log saved", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    //self.navigationController?.popViewController(animated: true)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
