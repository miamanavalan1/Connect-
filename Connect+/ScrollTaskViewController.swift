//
//  ScrollTaskViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class DotButton: UIButton {
    required init(titleString: String) {
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
        tintColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        frame.size = CGSize(width: 332, height: 60)
        translatesAutoresizingMaskIntoConstraints = false
        //widthAnchor.constraint(equalToConstant: 332).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        setTitle(titleString, for: .normal)
        contentHorizontalAlignment = .left
        titleLabel?.font =  UIFont(name: "Assistant-Bold", size: 20)
        setImage(UIImage(named: "ellipse.png"), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 20, left: 292, bottom: 20, right: 20)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SquareButton: UIButton {
    
    required init(titleString: String) {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8705882353, blue: 0.8392156863, alpha: 1)
        setTitleColor(UIColor.black, for: .normal)
        frame.size = CGSize(width: 154, height: 100)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        widthAnchor.constraint(equalToConstant: 154).isActive = true
        
        setTitle(titleString, for: .normal)
        contentHorizontalAlignment = .center
        titleLabel?.font = UIFont(name: "Assistant-Regular", size: 17.0)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ScrollTaskViewController: UIViewController {
    
    var stackView = UIStackView()
    var scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var get_task_url = URLComponents(string: "http://127.0.0.1:8000/get_task")!
        let session = URLSession.shared
        get_task_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username)]
        
        struct single_task: Decodable{
            let title: String
            let detail: String
            let deadline: String
            let finished_at: String
            let status: String
        }
        
        
        let task = session.dataTask(with: get_task_url.url!, completionHandler: {data, response, error in
            print(data)
            if error == nil {
                let tasks: [single_task] = try! JSONDecoder().decode([single_task].self, from: data!)
                
                // sort into completed tasks and incomplete tasks
                // add views here as it is task completion
                // move all add view here
                
                
                
                
                
                
                
                
            }
        })
        task.resume()
        
        
        
        
        var pagetitle: UILabel!
        pagetitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 110))
        pagetitle.heightAnchor.constraint(equalToConstant: 110).isActive = true
        pagetitle.text = "Tasks"
        pagetitle.textAlignment = .center
        pagetitle.font = UIFont(name: "Marvel-Bold", size: 30.0)
        pagetitle.textColor = UIColor.black
        
        var subtitle1: UILabel!
        var subtitle2: UILabel!
        var subtitle3: UILabel!
        
        subtitle1 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        subtitle2 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        subtitle3 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        subtitle1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subtitle2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subtitle3.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subtitle1.textAlignment = .left
        subtitle2.textAlignment = .left
        subtitle3.textAlignment = .left
        subtitle1.font = UIFont(name: "Marvel-Regular", size: 20.0)
        subtitle2.font = UIFont(name: "Marvel-Regular", size: 20.0)
        subtitle3.font = UIFont(name: "Marvel-Regular", size: 20.0)
        subtitle1.textColor = UIColor.black
        subtitle2.textColor = UIColor.black
        subtitle3.textColor = UIColor.black
        subtitle1.text = "Tasks to complete"
        subtitle2.text = "Completed tasks in past 7 days"
        subtitle3.text = "Add a task"
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(pagetitle)
        stackView.addArrangedSubview(subtitle1)
        
        //to dos
        let todo1 = DotButton(titleString: "Grocery Shopping")
        todo1.addTarget(self, action: #selector(GoToShoppingToDo(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(todo1)
        
        stackView.addArrangedSubview(subtitle2)
        
        //completed
        let completed1 = DotButton(titleString: "Bathroom Cleaning")
        completed1.addTarget(self, action: #selector(GoToCompleted(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(completed1)
        
        stackView.addArrangedSubview(subtitle3)
        
        //add tasks options
        
        var row1 = UIStackView()
        var row2 = UIStackView()
        var row3 = UIStackView()
        
        row1.axis = .horizontal
        row2.axis = .horizontal
        row3.axis = .horizontal
        
        row1.distribution = .fill
        row2.distribution = .fill
        row3.distribution = .fill
        
        row1.spacing = 26
        row2.spacing = 26
        row3.spacing = 26
        
        
        stackView.addArrangedSubview(row1)
        stackView.addArrangedSubview(row2)
        stackView.addArrangedSubview(row3)
        
        
        let sbtn1 = SquareButton(titleString: "Grocery Shopping")
        let sbtn2 = SquareButton(titleString: "Bathroom Cleaning")
        let sbtn3 = SquareButton(titleString: "Mopping Floors")
        let sbtn4 = SquareButton(titleString: "Kitchen Cleaning")
        let sbtn5 = SquareButton(titleString: "Cooking")
        let sbtn6 = SquareButton(titleString: "Dishes")
        
        
        //AddShoppingTaskViewController
        sbtn1.addTarget(self, action: #selector(AddShoppingBtnClicked(_:)), for: .touchUpInside)
        sbtn2.addTarget(self, action: #selector(NormalBtnClicked(_:)), for: .touchUpInside)
        sbtn3.addTarget(self, action: #selector(NormalBtnClicked(_:)), for: .touchUpInside)
        sbtn4.addTarget(self, action: #selector(NormalBtnClicked(_:)), for: .touchUpInside)
        //AddCookingTaskViewController
        sbtn5.addTarget(self, action: #selector(AddCookingBtnClicked(_:)), for: .touchUpInside)
        sbtn6.addTarget(self, action: #selector(NormalBtnClicked(_:)), for: .touchUpInside)
        
        
        
        
        
        row1.addArrangedSubview(sbtn1)
        row1.addArrangedSubview(sbtn2)
        row2.addArrangedSubview(sbtn3)
        row2.addArrangedSubview(sbtn4)
        row3.addArrangedSubview(sbtn5)
        row3.addArrangedSubview(sbtn6)
        
        
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        
        row1.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        row2.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        row3.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        
        //row1.topAnchor.constraint(equalTo: subtitle3.bottomAnchor).isActive = true
        
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        
    }
    
    @objc func NormalBtnClicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddNormalTastViewController") as? AddNormalTastViewController
        next?.taskName = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func AddShoppingBtnClicked(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(identifier: "AddShoppingTaskViewController") as? AddShoppingTaskViewController
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func AddCookingBtnClicked(_ sender:UIButton) {
        let next = storyboard?.instantiateViewController(identifier: "AddCookingTaskViewController") as? AddCookingTaskViewController
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func GoToShoppingToDo(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(identifier: "ShoppingToDoDetailViewController") as? ShoppingToDoDetailViewController
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func GoToToDo(_ sender: UIButton) {
        let taskname = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "ToDoDetailViewController") as? ToDoDetailViewController
        next?.taskname = taskname!
        self.navigationController?.pushViewController(next!, animated: true)
        
    }
    
    @objc func GoToCompleted(_ sender: UIButton) {
        let taskname = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "CompletedDetailViewController") as? CompletedDetailViewController
        next?.taskname = taskname!
        self.navigationController?.pushViewController(next!, animated: true)
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
