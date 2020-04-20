//
//  ScrollHealthViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/23/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import Foundation

class ArrowButton : UIButton {
    var detail: String?
    var id: Int?
    var created_at: String?
    required init(titleString : String) {
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
        tintColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1), for: .normal)
        frame.size = CGSize(width: 332, height: 60)
        translatesAutoresizingMaskIntoConstraints = false
        //widthAnchor.constraint(equalToConstant: 332).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        setTitle(titleString, for: .normal)
        contentHorizontalAlignment = .left
        titleLabel?.font =  UIFont(name: "Assistant-Bold", size: 20)
        setImage(UIImage(systemName: "chevron.right.2"), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 20, left: 320, bottom: 20, right: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ScrollHealthViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        arrangeview()
    }
        // Do any additional setup after loading the view.
    func arrangeview() {
        var stackView = UIStackView()
        var scrollView = UIScrollView()
        
        struct single_log: Decodable{
            let title: String
            let detail: String
            let id: String
            let created_at: String
        }
        
        var logs: [single_log] = []
        
        var get_log_url = URLComponents(string: "http://127.0.0.1:8000/get_health")!
        let session = URLSession.shared
        get_log_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username)]
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = session.dataTask(with: get_log_url.url!, completionHandler: {data, response, error in
            print(response)
            print(data)
            if error == nil {
                logs = try! JSONDecoder().decode([single_log].self, from:data!)
            }
            semaphore.signal()
        })
        task.resume()
        semaphore.wait()
        
        
        
        
        
        
        var pagetitle: UILabel!
        pagetitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 110))
        pagetitle.heightAnchor.constraint(equalToConstant: 110).isActive = true
        pagetitle.text = "Health"
        pagetitle.textAlignment = .center
        pagetitle.font = UIFont(name: "Marvel-Bold", size: 40.0)
        pagetitle.textColor = UIColor.darkGray
        
        //get current date
        //get health log in past 7 days, display in reverse chronological order
        //do not display the date if no record is found for the day
        
        
        var subtitle: UILabel!
        
        
        subtitle = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        
        subtitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        subtitle.textAlignment = .left
        
        subtitle.font = UIFont(name: "Marvel-Bold", size: 25.0)
        subtitle.textColor = UIColor.darkGray
        subtitle.text = "Add health updates"
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        //scrollView.showsHorizontalScrollIndicator = false
        //scrollView.showsVerticalScrollIndicator = false
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 27, bottom: 0, trailing: -28)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(pagetitle)
        //add dates and logs accordingly
        
        
        //adding from vector logs
        for item in logs {
            //date label
            var date: UILabel!
            date = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
            date.heightAnchor.constraint(equalToConstant: 25).isActive = true
            date.textAlignment = .left
            date.font = UIFont(name: "Marvel-Bold", size: 25.0)
            date.textColor = UIColor.darkGray
            date.text = item.created_at
            stackView.addArrangedSubview(date)
            //button
            let logbutton = ArrowButton(titleString: item.title)
            logbutton.addTarget(self, action: #selector(GoToHealthDetail(_:)), for: .touchUpInside)
            logbutton.detail = item.detail
            logbutton.id = Int(item.id)
            logbutton.created_at = item.created_at
            stackView.addArrangedSubview(logbutton)
        }
        
        //for adding a new health log
        stackView.addArrangedSubview(subtitle)
        
        var row1 = UIStackView()
        var row2 = UIStackView()
        var row3 = UIStackView()
        var row4 = UIStackView()
        
        row1.axis = .horizontal
        row2.axis = .horizontal
        row3.axis = .horizontal
        row4.axis = .horizontal
        
        row1.distribution = .equalCentering
        row2.distribution = .equalCentering
        row3.distribution = .equalCentering
        row4.distribution = .equalCentering
        
        row1.spacing = 26
        row2.spacing = 26
        row3.spacing = 26
        row4.spacing = 26
        
        row1.isLayoutMarginsRelativeArrangement = true
        row1.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        row2.isLayoutMarginsRelativeArrangement = true
        row2.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        row3.isLayoutMarginsRelativeArrangement = true
        row3.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        row4.isLayoutMarginsRelativeArrangement = true
        row4.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        
        
        stackView.addArrangedSubview(row1)
        stackView.addArrangedSubview(row2)
        stackView.addArrangedSubview(row3)
        stackView.addArrangedSubview(row4)
        
        
        let sbtn1 = SquareButton(titleString: "Heartburn")
        let sbtn2 = SquareButton(titleString: "Nausea")
        let sbtn3 = SquareButton(titleString: "Fatigue")
        let sbtn4 = SquareButton(titleString: "Braxton Hicks")
        let sbtn5 = SquareButton(titleString: "Backache")
        let sbtn6 = SquareButton(titleString: "Baby Kicking")
        let sbtn7 = SquareButton(titleString: "Dizziness")
        let sbtn8 = SquareButton(titleString: "Headache")
        
        
        sbtn1.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn2.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn3.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn4.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn5.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn6.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn7.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        sbtn8.addTarget(self, action: #selector(AddHealthBtnClicked(_:)), for: .touchUpInside)
        
        
        
        row1.addArrangedSubview(sbtn1)
        row1.addArrangedSubview(sbtn2)
        row2.addArrangedSubview(sbtn3)
        row2.addArrangedSubview(sbtn4)
        row3.addArrangedSubview(sbtn5)
        row3.addArrangedSubview(sbtn6)
        row4.addArrangedSubview(sbtn7)
        row4.addArrangedSubview(sbtn8)
        
        
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        row4.translatesAutoresizingMaskIntoConstraints = false
        
        row1.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        row2.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        row3.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        row4.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = false
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(refreshControl:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
    }
    
    @objc func AddHealthBtnClicked(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "AddHealthViewController") as? AddHealthViewController
        next?.name = buttonTitle!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func GoToHealthDetail(_ sender: ArrowButton) {
        let healthname = sender.title(for: .normal)
        let next = storyboard?.instantiateViewController(identifier: "HealthDetailViewController") as? HealthDetailViewController
        next?.healthname = healthname!
        next?.addedtime = sender.created_at!
        next?.healthdetail = sender.detail!
        next?.id = sender.id!
        
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        print("refreshing")
        for v in self.view.subviews {
            v.removeFromSuperview()
        }
        arrangeview()
        refreshControl.endRefreshing()
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
