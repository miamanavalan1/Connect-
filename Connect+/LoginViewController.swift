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
var unique_username = ""
import Foundation
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
        var fb_login_url = URLComponents(string: "http://127.0.0.1:8000/login_fb")!
        let session = URLSession.shared
        var is_newuser = false
        
        fb_login_url.queryItems = [URLQueryItem(name: "accessToken", value: AccessToken.current?.tokenString)]
        
        
        
        struct test_newuser: Decodable{
            let answer: String
            let username: String
        }
        var semaphore = DispatchSemaphore(value: 0)
        let task = session.dataTask(with: fb_login_url.url!, completionHandler: {data, response, error in
            //print(error)
            print(response)
            if error != nil {
                print(error)
                return
            }
            let test: test_newuser = try! JSONDecoder().decode(test_newuser.self, from: data!)
            print(test.answer)
            print(test.username)
            unique_username = test.username
            print(unique_username)
            if test.answer == "True" {
                is_newuser = true
            }
            semaphore.signal()
        })
        
        task.resume()
        semaphore.wait()
        
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
