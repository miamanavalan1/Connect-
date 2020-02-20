//
//  TaskViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

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

    @IBAction func NormalBtnClicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddNormalTastViewController") as? AddNormalTastViewController
        next?.taskName = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func NormalBtn2Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddNormalTastViewController") as? AddNormalTastViewController
        next?.taskName = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func NormalBtn3Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddNormalTastViewController") as? AddNormalTastViewController
        next?.taskName = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func NormalBtn4Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddNormalTastViewController") as? AddNormalTastViewController
        next?.taskName = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    
    
}
