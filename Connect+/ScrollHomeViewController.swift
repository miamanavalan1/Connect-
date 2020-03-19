//
//  ScrollHomeViewController.swift
//  Connect+
//
//  Created by 陈金然陈金然 on 3/17/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

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
            row1 = UILabel(frame: CGRect(x: 120, y: 10, width: 280, height: 24))
            row2 = UILabel(frame: CGRect(x: 120, y: 34, width: 280, height: 24))
            rowtime = UILabel(frame: CGRect(x: 120, y: 58, width: 280, height: 12))
            
            row1.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.8705882353, blue: 0.8392156863, alpha: 1)
            row1.text = "You " + self.action!
            row1.font = UIFont(name: "Assistant-Bold", size: 15.0)
            row1.textAlignment = .right
            row1.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row1.layer.borderWidth = 1.0
            row1.layer.borderColor = #colorLiteral(red: 0.3578933477, green: 0.3579024673, blue: 0.3578975797, alpha: 1)
            
            row2.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
            row2.text = self.content!
            row2.font = UIFont(name: "Assistant-Regular", size: 15.0)
            row2.textAlignment = .right
            row2.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row2.layer.borderWidth = 1.0
            row2.layer.borderColor = #colorLiteral(red: 0.3578933477, green: 0.3579024673, blue: 0.3578975797, alpha: 1)
            
            rowtime.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            rowtime.text = self.time!
            rowtime.font = UIFont.italicSystemFont(ofSize: 11.0)
            rowtime.textAlignment = .right
            rowtime.textColor = UIColor.lightGray
            
            self.addSubview(row1)
            self.addSubview(row2)
            self.addSubview(rowtime)
        } else {
            row1 = UILabel(frame: CGRect(x: 14, y: 10, width: 280, height: 24))
            row2 = UILabel(frame: CGRect(x: 14, y: 34, width: 280, height: 24))
            rowtime = UILabel(frame: CGRect(x: 14, y: 58, width: 280, height: 12))
            
            row1.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.8980392157, blue: 0.9294117647, alpha: 1)
            row1.text = self.name! + " " + self.action!
            row1.font = UIFont(name: "Assistant-Bold", size: 15.0)
            row1.textAlignment = .left
            row1.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row1.layer.borderWidth = 1.0
            row1.layer.borderColor = #colorLiteral(red: 0.3578933477, green: 0.3579024673, blue: 0.3578975797, alpha: 1)
            
            row2.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
            row2.text = self.content!
            row2.font = UIFont(name: "Assistant-Regular", size: 15.0)
            row2.textAlignment = .left
            row2.textColor = #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4196078431, alpha: 1)
            row2.layer.borderWidth = 1.0
            row2.layer.borderColor = #colorLiteral(red: 0.3578933477, green: 0.3579024673, blue: 0.3578975797, alpha: 1)
            
            rowtime.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            rowtime.text = self.time!
            rowtime.font = UIFont.italicSystemFont(ofSize: 11.0)
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
    var stackView = UIStackView()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let homeview: UIView!
        homeview = UIView(frame: CGRect(x: 0, y: 100, width: 414, height: 800))
        homeview.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        homeview.heightAnchor.constraint(equalToConstant: 800).isActive = true
        
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
        title.textColor = UIColor.white
        title.font = UIFont(name: "Marvel-Bold", size: 40.0)
        
        homeview.addSubview(title)
        
        let tip: UILabel!
        tip = UILabel(frame: CGRect(x: 52, y: 270, width: 270, height: 150))
        tip.text = "Can't sleep well? It might be time for a body pillow."
        tip.numberOfLines = 3
        tip.textAlignment = .left
        tip.textColor = UIColor.white
        tip.font = UIFont(name: "Assistant-Regular", size: 30.0)
        
        homeview.addSubview(tip)
        
        let logoutbtn: UIButton!
        logoutbtn = UIButton(frame: CGRect(x: 345, y: 577, width: 60, height: 30))
        logoutbtn.setTitle("Log out", for: .normal)
        logoutbtn.setTitleColor(UIColor.link, for: .normal)
        logoutbtn.titleLabel?.font = UIFont(name: "System", size: 15.0)
        
        homeview.addSubview(logoutbtn)
        
        let newsfeed: UILabel!
        newsfeed = UILabel(frame: CGRect(x: 20, y: 700, width: 270, height: 48.5))
        newsfeed.text = "Newsfeed \u{2228}"
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
        let msg1 = NewsItem(currentuser: true, action: "added a task", content: "Mop the floors", time: "1/30/2020, 7:30 AM", name: "Mary")
        let msg2 = NewsItem(currentuser: false, action: "sent a message", content: "You're doing great!!", time: "1/27/2020, 8:30 AM", name: "John")
        
        stackView.addArrangedSubview(msg1)
        stackView.addArrangedSubview(msg2)
        
        
        
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        
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