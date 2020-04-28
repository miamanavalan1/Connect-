//
//  ConnectAlertController.swift
//  Connect+
//
//  Created by lujiaan on 4/28/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class ConnectAlertController: UIViewController {
    
    
    @IBOutlet weak var StartBtn: UIButton!
    
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        //view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        StartBtn.addTarget(self, action: #selector(StartBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc func StartBtnClicked(_ sender: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ScrollHomeViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
        //let next = storyboard?.instantiateViewController(identifier: "ScrollHomeViewController") as? ScrollHomeViewController
        //self.navigationController?.popToViewController(next!, animated: true)
    }
}
