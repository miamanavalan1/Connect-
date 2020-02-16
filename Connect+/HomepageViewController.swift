//
//  HomepageViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/16/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class HomepageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        if let accessToken = AccessToken.current{
            AccessToken.current = nil
            let myLogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let loginDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            loginDelegate.window?.rootViewController = myLogin
            //let myLogin = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            //self.present(myLogin!, animated: true, completion: nil)
            
        }
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
