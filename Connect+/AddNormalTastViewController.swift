//
//  AddNormalTastViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class AddNormalTastViewController: UIViewController {

    @IBOutlet weak var textTaskName: UILabel!
    
    @IBOutlet weak var deadline: UITextField!
    
    @IBOutlet weak var detail: UITextField!

    var deadline_to_send = ""
    
    var taskName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTaskName.text = taskName
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = UIDatePicker.Mode.date
        datepicker.addTarget(self, action: #selector(DatePickerChanged(_:)), for: UIControl.Event.valueChanged)
        deadline.inputView = datepicker
        
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func SaveBtnClicked(_ sender: Any) {
        var if_success = true
        let session = URLSession.shared
        let add_task_url = URL(string: "http://127.0.0.1:8000/add_task")!
        var add_task_request = URLRequest(url: add_task_url)
        add_task_request.httpMethod = "POST"
        add_task_request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["username": unique_username, "deadline": deadline_to_send, "title": taskName, "detail": detail.text] as [String : Any]
        let j_parameters = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        struct add_task_response: Decodable{
            let success: String
            let message: String
        }
        
        let task = session.uploadTask(with: add_task_request, from: j_parameters) {
            data, response, error in
            print(response)
            if error == nil {
                let rst: add_task_response = try! JSONDecoder().decode(add_task_response.self, from: data!)
                print(rst.success)
                print(rst.message)
                if rst.success == "False" {
                    if_success = false
                }
            }
        }
        task.resume()
        
        
        
        let alertController: UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popViewController(animated: true) })
        alertController = UIAlertController(title: "Success", message: "Task saved", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func DatePickerChanged(_ sender: UIDatePicker){
        let format = DateFormatter()
        format.dateStyle = DateFormatter.Style.medium
        format.timeStyle = DateFormatter.Style.none
        deadline.text = format.string(from: sender.date)
        
        let format_to_send = DateFormatter()
        format_to_send.locale = Locale(identifier: "en-CA")
        format_to_send.dateStyle = DateFormatter.Style.short
        format_to_send.timeStyle = DateFormatter.Style.none
        deadline_to_send = format_to_send.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
