//
//  ToDoDetailViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/30/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    var taskname = ""
    var taskdetail = ""
    var showtaskname: UILabel!
    var showtaskdetail: UILabel!
    var showdeadline: UILabel!
    var deadline: String?
    var id: Int?
    
    @IBAction func MarkAsDoneClicked(_ sender: Any) {
        var complete_task_url = URLComponents(string: "http://127.0.0.1:8000/complete_task")!
        let session = URLSession.shared
        complete_task_url.queryItems = [URLQueryItem(name: "id", value: String(self.id!))]
        
        let semaphore = DispatchSemaphore(value: 0)
        let task = session.dataTask(with: complete_task_url.url!, completionHandler: {data, response, error in
            if error != nil {
                print("error happens")
            }
            semaphore.signal()
        })
        task.resume()
        semaphore.wait()
        
        let alertController: UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popViewController(animated: true) })
        alertController = UIAlertController(title: "", message: "Task marked as done.", preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //taskdetail = "detail"
        
        showtaskname = UILabel(frame: CGRect(x: 7, y: 137, width: 400, height: 37))
        showtaskname.text = taskname
        showtaskname.textAlignment = .center
        showtaskname.textColor = UIColor.black
        showtaskname.font = UIFont(name: "Marvel-Bold", size: 30.0)
        
        showtaskdetail = UILabel(frame: CGRect(x: 37, y: 398, width: 342, height: 293))
        showtaskdetail.text = taskdetail
        showtaskdetail.textColor = UIColor.black
        showtaskdetail.font = UIFont(name: "Assistant-Regular", size: 20.0)
        showtaskdetail.sizeToFit()
        
        showdeadline = UILabel(frame: CGRect(x: 37, y: 332, width: 342, height: 25))
        showdeadline.text = "Complete by " + deadline!
        showdeadline.textColor = UIColor.black
        showdeadline.font = UIFont(name: "Marvel-Regular", size: 20.0)
        
        self.view.addSubview(showtaskname)
        self.view.addSubview(showtaskdetail)
        self.view.addSubview(showdeadline)
        
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
