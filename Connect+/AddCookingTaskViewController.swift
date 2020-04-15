//
//  AddCookingTaskViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddCookingTaskViewController: UIViewController {

    @IBOutlet weak var title_display: UILabel!
    
    @IBOutlet weak var deadline: UITextField!
    
    @IBOutlet weak var detail: UITextField!
    
    var deadline_to_send = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = UIDatePicker.Mode.date
        datepicker.addTarget(self, action: #selector(DatePickerChanged(_:)), for: UIControl.Event.valueChanged)
        deadline.inputView = datepicker
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

    @IBAction func SaveBtnClicked(_ sender: Any) {
        let session = URLSession.shared
        let add_task_url = URL(string: "http://127.0.0.1:8000/add_task")!
        var add_task_request = URLRequest(url: add_task_url)
        add_task_request.httpMethod = "POST"
        add_task_request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["unique_username": unique_username, "deadline": deadline_to_send, "title": "Cooking", "detail": detail.text] as [String : Any]
        let j_parameters = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        add_task_request.httpBody = j_parameters
        print("parameters are:")
        print(j_parameters.base64EncodedString())
        print("end of parameters")
        struct add_task_response: Decodable{
            let success: String
            let message: String
        }
        let task = session.dataTask(with: add_task_request as URLRequest) {
            data, response, error in
            print(response)
            if error == nil {
                let rst: add_task_response = try! JSONDecoder().decode(add_task_response.self, from: data!)
                print(rst.success)
                print(rst.message)
                
                if rst.success == "False" {
                    print("not success")
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
}
