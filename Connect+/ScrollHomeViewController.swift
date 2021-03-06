//
//  ScrollHomeViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/17/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Foundation

class NewsItem : UIView {
    var currentuser: Bool?
    var action: String?
    var content: String?
    var name: String?
    var time: String?
    var row1: UILabel!
    var row2: UILabel!
    var rowtime: UILabel!
    
    init(currentuser: Bool, action: String, content: String, time: String, name: String) {
        self.currentuser = currentuser
        self.action = action
        self.content = content
        self.time = time
        self.name = name
        
        super.init(frame: CGRect(x: 0, y: 0, width: 414, height: 80))
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        if currentuser == true {
            row1 = UILabel(frame: CGRect(x: 120, y: 10, width: 280, height: 26))
            row2 = UILabel(frame: CGRect(x: 120, y: 34, width: 280, height: 26))
            rowtime = UILabel(frame: CGRect(x: 120, y: 64, width: 280, height: 12))
            
            row1.layer.backgroundColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)
            row1.text = "You " + self.action! + "\t"
            row1.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
            row1.textAlignment = .right
            row1.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row1.layer.borderWidth = 1.0
            row1.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row1.layer.cornerRadius = 18
            row1.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row1.layer.shadowRadius = 2
            row1.layer.shadowOpacity = 0.5
            row1.layer.shadowOffset = CGSize(width: 0, height: 0)
            row1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            
            row2.layer.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
            row2.text = self.content! + "\t"
            row2.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
            row2.textAlignment = .right
            row2.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row2.layer.borderWidth = 1.0
            row2.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row2.layer.cornerRadius = 18
            row2.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row2.layer.shadowRadius = 2
            row2.layer.shadowOpacity = 0.5
            row2.layer.shadowOffset = CGSize(width: 0, height: 0)
            row2.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            rowtime.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            rowtime.text = self.time! + "\t"
            rowtime.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
            rowtime.textAlignment = .right
            rowtime.textColor = UIColor.lightGray
            
            self.addSubview(row1)
            self.addSubview(row2)
            self.addSubview(rowtime)
        } else {
            row1 = UILabel(frame: CGRect(x: 14, y: 10, width: 280, height: 26))
            row2 = UILabel(frame: CGRect(x: 14, y: 34, width: 280, height: 26))
            rowtime = UILabel(frame: CGRect(x: 14, y: 64, width: 280, height: 12))
            
            row1.layer.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.8980392157, blue: 0.9294117647, alpha: 1)
            row1.text = "\t" + self.name! + " " + self.action!
            row1.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
            row1.textAlignment = .left
            row1.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row1.layer.borderWidth = 1.0
            row1.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row1.layer.cornerRadius = 18
            row1.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row1.layer.shadowRadius = 2
            row1.layer.shadowOpacity = 0.5
            row1.layer.shadowOffset = CGSize(width: 0, height: 0)
            row1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            row2.layer.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
            row2.text = "\t" + self.content!
            row2.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
            row2.textAlignment = .left
            row2.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row2.layer.borderWidth = 1.0
            row2.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row2.layer.cornerRadius = 18
            row2.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            row2.layer.shadowRadius = 2
            row2.layer.shadowOpacity = 0.5
            row2.layer.shadowOffset = CGSize(width: 0, height: 0)
            row2.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            rowtime.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            rowtime.text =  "\t" + self.time!
            rowtime.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
            rowtime.textAlignment = .left
            rowtime.textColor = UIColor.lightGray
            
            self.addSubview(row1)
            self.addSubview(row2)
            self.addSubview(rowtime)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class ScrollHomeViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        arrangeview()
    }
    
    func arrangeview() {
        var stackView = UIStackView()
        var scrollView = UIScrollView()
        
        
        var get_news_url = URLComponents(string: "http://127.0.0.1:8000/get_news")!
        let session = URLSession.shared
        print("username is")
        print(unique_username)
        get_news_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username)]
        
        struct single_news: Decodable {
            let action: String
            let content: String
            let created_at: String
            let created_by: String
        }
        
        var news: [single_news] = []
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = session.dataTask(with: get_news_url.url!, completionHandler: {data, response, error in
            print(response)
            
            if error == nil {
                news = try! JSONDecoder().decode([single_news].self, from:data!)
            }
            semaphore.signal()
        })
        task.resume()
        
        semaphore.wait()
        
        
        let profileBtn = UIButton(type: .system)
        profileBtn.setImage(UIImage(systemName: "person.circle"), for: .normal)
        profileBtn.tintColor = .darkGray
        profileBtn.addTarget(self, action: #selector(profileBtnClicked), for: .touchUpInside)
        //profileBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)

        let barButton = UIBarButtonItem(customView: profileBtn)
        //let btnWidth = barButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        //btnWidth?.isActive = true
        //let btnHeight = barButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        //btnHeight?.isActive = true
        
        self.navigationItem.rightBarButtonItem = barButton

        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //scrollView.showsHorizontalScrollIndicator = false
        //scrollView.showsVerticalScrollIndicator = false
        
        let homeview: UIView!
        homeview = UIView(frame: CGRect(x: 0, y: 100, width: 414, height: 700))
        homeview.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        homeview.heightAnchor.constraint(equalToConstant: 700).isActive = true
        
        let image = UIImage(named: "overlay of squares.png")
        var imageView: UIImageView!
        imageView = UIImageView(frame: CGRect(x: 0, y: 171, width: 414, height: 398))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        
        homeview.addSubview(imageView)
        
        let title: UILabel!
        title = UILabel(frame: CGRect(x: 52, y: 214, width: 156, height: 49))
        title.text = "Day 40"
        title.textAlignment = .left
        title.textColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        title.font = UIFont(name: "Marvel-Bold", size: 40.0)
        
        homeview.addSubview(title)
        
        let tip: UILabel!
        tip = UILabel(frame: CGRect(x: 52, y: 270, width: 270, height: 150))
        tip.text = "Can't sleep well? It might be time for a body pillow."
        tip.numberOfLines = 3
        tip.textAlignment = .left
        tip.textColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        tip.font = UIFont(name: "Assistant-Regular", size: 30.0)
        
        homeview.addSubview(tip)
        
        /*let logoutbtn: UIButton!
        logoutbtn = UIButton(frame: CGRect(x: 345, y: 577, width: 60, height: 30))
        logoutbtn.setTitle("Log out", for: .normal)
        logoutbtn.setTitleColor(UIColor.darkGray, for: .normal)
        logoutbtn.titleLabel?.font = UIFont(name: "Marvel-Bold", size: 18.0)
        logoutbtn.addTarget(self, action: #selector(LogoutBtnClicked(_:)), for: .touchUpInside)
        
        homeview.addSubview(logoutbtn)*/
        
        let newsfeed: UILabel!
        newsfeed = UILabel(frame: CGRect(x: 20, y: 600, width: 270, height: 48.5))
        newsfeed.text = "Newsfeed \u{29C1}"
        newsfeed.textAlignment = .left
        newsfeed.textColor = UIColor.darkGray
        newsfeed.font = UIFont(name: "Marvel-Bold", size: 40.0)
        
        homeview.addSubview(newsfeed)
        
        
        
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(homeview)
        
        
        //News items
        let msg1 = NewsItem(currentuser: true, action: "added a task", content: "Grocery Shopping", time: "4/25/2020, 10:30", name: "Mary")
        
        let msg2 = NewsItem(currentuser: false, action: "sent a message", content: "Grocery shopping finished!", time: "4/25/2020, 18:30", name: "John")
        
        let msg3 = NewsItem(currentuser: false, action: "sent a message", content: "How are u doing today?", time: "4/26/2020, 13:30", name: "John")
        
        let msg4 = NewsItem(currentuser: true, action: "sent a message", content: "All good!!\t", time: "4/26/2020, 14:30", name: "Mary")
        
        let msg5 = NewsItem(currentuser: false, action: "sent a message", content: "You're doing great!!", time: "4/27/2020, 8:30", name: "John")
        
        let msg6 = NewsItem(currentuser: true, action: "added a task", content: "Mop the floors", time: "4/27/2020, 10:30", name: "Mary")
        
        stackView.addArrangedSubview(msg1)
        stackView.addArrangedSubview(msg2)
        stackView.addArrangedSubview(msg3)
        stackView.addArrangedSubview(msg4)
        stackView.addArrangedSubview(msg5)
        stackView.addArrangedSubview(msg6)
 
        if news.isEmpty {
            var no_news: UILabel!
            no_news = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 25))
            no_news.text = "No news in past 7 days"
            no_news.heightAnchor.constraint(equalToConstant: 25).isActive = true
            no_news.textAlignment = .left
            no_news.font = UIFont(name: "Marvel-Bold", size: 25.0)
            no_news.textColor = UIColor.darkGray
            stackView.addArrangedSubview(no_news)
        } else {
            for item in news{
                if item.created_by == unique_username {
                    var msg = NewsItem(currentuser: true, action: item.action, content: item.content, time: item.created_at, name: item.created_by)
                    stackView.addArrangedSubview(msg)
                }else {
                    var msg = NewsItem(currentuser: false, action: item.action, content: item.content, time: item.created_at, name: item.created_by)
                    stackView.addArrangedSubview(msg)
                }
            }
        }
        
        

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(refreshControl:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
    }
    
    /*@objc func LogoutBtnClicked(_ sender: UIButton) {
        if let accessToken = AccessToken.current{
            AccessToken.current = nil
            let myLogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let loginDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            loginDelegate.window?.rootViewController = myLogin
            //let myLogin = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            //self.present(myLogin!, animated: true, completion: nil)
        }
    }*/
    
    @objc func profileBtnClicked(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController
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
