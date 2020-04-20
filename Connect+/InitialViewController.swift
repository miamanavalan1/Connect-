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
import Foundation

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
            
            
            //get username first
            var fb_get_username_url = URLComponents(string: "http://127.0.0.1:8000/get_username_from_token")!
            let session = URLSession.shared
            fb_get_username_url.queryItems = [URLQueryItem(name: "accessToken", value: AccessToken.current?.tokenString)]
            
            struct test_newuser: Decodable{
                let success: String
                let username: String
            }
            
            var semaphore = DispatchSemaphore(value: 0)
            
            let task = session.dataTask(with: fb_get_username_url.url!, completionHandler: {data, response, error in
                print(response)
                if error != nil {
                    print(error)
                    return
                }
                let test: test_newuser = try! JSONDecoder().decode(test_newuser.self, from: data!)
                print(test.success)
                print(test.username)
                unique_username = test.username
                print(unique_username)
                semaphore.signal()
            })
            task.resume()
            
            semaphore.wait()
            print("get username")
            print(unique_username)
            
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
