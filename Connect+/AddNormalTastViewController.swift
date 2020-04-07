//
//  AddNormalTastViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 2/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AddNormalTastViewController: UIViewController {

    @IBOutlet weak var textTaskName: UILabel!
    
    @IBOutlet weak var deadline: UITextField!
    
    
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
