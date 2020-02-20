//
//  AddHealthViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddHealthViewController: UIViewController {

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
    
    @IBAction func Btn1Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    
    @IBAction func Btn2Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    
    @IBAction func Btn3Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func Btn4Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func Btn5Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func Btn6Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func Btn7Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func Btn8Clicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    
}
