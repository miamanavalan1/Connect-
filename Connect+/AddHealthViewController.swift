//
//  HealthDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddHealthViewController: UIViewController {

    @IBOutlet weak var HealthDetail: UITextField!
    
    @IBOutlet weak var HealthName: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        HealthName.text = name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveBtnClicked(_ sender: Any) {
        let session = URLSession.shared
        let add_log_url = URL(string: "http://127.0.0.1:8000/add_health")!
        var add_log_request = URLRequest(url: add_log_url)
        add_log_request.httpMethod = "POST"
        add_log_request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["unique_username": unique_username, "title": name, "detail": HealthDetail.text] as [String : Any]
        let j_parameters = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        add_log_request.httpBody = j_parameters
        print("parameters are:")
        print(j_parameters.base64EncodedString())
        print("end of parameters")
        
        let task = session.dataTask(with: add_log_request as URLRequest) {
            data, response, error in
            print(response)
        }
        task.resume()
        
        
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
