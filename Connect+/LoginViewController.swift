//
//  LoginViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/16/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loginManagerDidComplete(_ result: LoginResult) {
      let alertController: UIAlertController
      let okAction = UIAlertAction(title: "OK", style: .default)
      
      switch result {
      case .cancelled:
        alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login.", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
      case .failed(let error):
        alertController = UIAlertController(title: "Login Fail", message: "Login failed with error \(error)", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
      case .success(let grantedPermissions, _, _):
        //alertController = UIAlertController(title: "Login Success", message: "Login succeeded with granted permissions: \(grantedPermissions)", preferredStyle: .alert)
        //let homepagevc = self.storyboard?.instantiateViewController(identifier: "HomepageViewController") as? HomepageViewController
        //self.present(homepagevc!, animated: true, completion: nil)
        let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
        let tbDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        tbDelegate.window?.rootViewController = myTabBar
        
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if let accessToken = AccessToken.current{
            //let homepagevc = self.storyboard?.instantiateViewController(identifier: "HomepageViewController") as? HomepageViewController
            //self.present(homepagevc!, animated: true, completion: nil)
            
            let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            let tbDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            tbDelegate.window?.rootViewController = myTabBar
            
            //self.navigationController?.pushViewController(secondViewController, animated: true)
        }else{
            let manager = LoginManager()
            manager.logIn(permissions: [.publicProfile], viewController: self){ result in
                self.loginManagerDidComplete(result)
            }
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
