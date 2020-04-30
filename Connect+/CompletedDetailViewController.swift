//
//  CompletedDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/30/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class CompletedDetailViewController: UIViewController {
    var taskname = ""
    var finishtime = ""
    var id: Int!
    var detail: String?
    
    @IBOutlet weak var showtaskname: UITextField!
    @IBOutlet weak var showfinishtime: UILabel!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //finishtime = "Feb 3, 2020"
        //showtaskname.text = taskname
        
        //showfinishtime.text = "Completed on " + finishtime
        button.addTarget(self, action: #selector(BtnClicked(_:)), for: .touchUpInside)
        
    }
    @objc func BtnClicked(_ sender: UIButton) {
        var appreciation_url = URLComponents(string: "http://127.0.0.1:8000/appreciation")!
        let session = URLSession.shared
        appreciation_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username), URLQueryItem(name: "action", value: "sent appreciation"), URLQueryItem(name: "content", value: "Thank you for "+taskname)]
        let semaphore = DispatchSemaphore(value: 0)
        let task = session.dataTask(with: appreciation_url.url!, completionHandler: {data, response, error in
            print(response)
            semaphore.signal()
        })
        task.resume()
        
        semaphore.wait()
        let alertController: UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController = UIAlertController(title: "Success", message: "Appreciation sent!", preferredStyle: .alert)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
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
