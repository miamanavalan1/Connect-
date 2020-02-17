//
//  InitialViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/17/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let accessToken = AccessToken.current{
            //let homepagevc = self.storyboard?.instantiateViewController(identifier: "HomepageViewController") as? HomepageViewController
            //self.present(homepagevc!, animated: true, completion: nil)
            
            let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            let tbDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            tbDelegate.window?.rootViewController = myTabBar
            
            //self.navigationController?.pushViewController(secondViewController, animated: true)
        }else{
            let myLogin = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! UIViewController
            let lgDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            lgDelegate.window?.rootViewController = myLogin
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
