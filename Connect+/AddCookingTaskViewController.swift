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
        datepicker.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
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
