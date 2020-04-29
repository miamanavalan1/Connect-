//
//  ProfileViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Foundation

class InfoButton : UIButton {
    required init(titleString : String){
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)
        tintColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
        titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        setTitleColor(.darkGray, for: .normal)
        frame.size = CGSize(width: 332, height: 80)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 80).isActive = true
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

class EraseButton : UIButton {
    required init(titleString : String){
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1), for: .normal)
        frame.size = CGSize(width: 270, height: 40)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        layer.cornerRadius = 20
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        setTitle(titleString, for: .normal)
        contentHorizontalAlignment = .center
        titleLabel?.font =  UIFont(name: "Marvel-Bold", size: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class privacyButton : UIButton {
    required init(titleString : String){
        
        super.init(frame: .zero)
               backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
               setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1), for: .normal)
               frame.size = CGSize(width: 270, height: 40)
               translatesAutoresizingMaskIntoConstraints = false
               heightAnchor.constraint(equalToConstant: 40).isActive = true
               layer.cornerRadius = 20
               layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
               layer.shadowRadius = 6
               layer.shadowOpacity = 0.7
               layer.shadowOffset = CGSize(width: 0, height: 0)
               
               setTitle(titleString, for: .normal)
               contentHorizontalAlignment = .center
               titleLabel?.font =  UIFont(name: "Marvel-Bold", size: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class logoutButton : UIButton {
    required init(titleString : String){
        
        super.init(frame: .zero)
        
           backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.7176470588, blue: 0.7294117647, alpha: 1)
           setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1), for: .normal)
           frame.size = CGSize(width: 270, height: 40)
           translatesAutoresizingMaskIntoConstraints = false
           heightAnchor.constraint(equalToConstant: 40).isActive = true
           layer.cornerRadius = 20
           layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           layer.shadowRadius = 6
           layer.shadowOpacity = 0.7
           layer.shadowOffset = CGSize(width: 0, height: 0)
           
           setTitle(titleString, for: .normal)
           contentHorizontalAlignment = .center
           titleLabel?.font =  UIFont(name: "Marvel-Bold", size: 25)
           //addTarget(self, action: #selector(LogoutBtnClicked(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ProfileViewController: UIViewController {

    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        var pagetitle: UILabel!
        pagetitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 110))
        pagetitle.heightAnchor.constraint(equalToConstant: 110).isActive = true
        pagetitle.text = "Settings"
        pagetitle.textAlignment = .center
        pagetitle.font = UIFont(name: "Marvel-Bold", size: 40.0)
        pagetitle.textColor = UIColor.darkGray
        
    
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27)
        
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(pagetitle)
    
        let babyName = InfoButton(titleString: "Grace\nChange the name of your baby")
        let dueDate = InfoButton(titleString: "August 23, 2020\nChange your due date")
        let babyGender = InfoButton(titleString: "Female\nChange gender of baby")
        let connection = InfoButton(titleString: "Not connected yet\nAdd your partner's account")
        let erase = EraseButton(titleString: "Erase My Data")
        let privacy = privacyButton(titleString: "Privacy Policy")
        let logout = logoutButton(titleString: "Log Out")
        connection.addTarget(self, action: #selector(editConnectBtnClicked(_:)), for: .touchUpInside)
        logout.addTarget(self, action: #selector(LogoutBtnClicked(_:)), for: .touchUpInside)
        erase.addTarget(self, action: #selector(EraseBtnClicked(_:)), for: .touchUpInside)
    
        stackView.addArrangedSubview(babyName)
        stackView.addArrangedSubview(dueDate)
        stackView.addArrangedSubview(babyGender)
        stackView.addArrangedSubview(connection)
        stackView.setCustomSpacing(30, after: connection)
        stackView.addArrangedSubview(erase)
        stackView.setCustomSpacing(10, after: erase)
        stackView.addArrangedSubview(privacy)
        stackView.setCustomSpacing(10, after: privacy)
        stackView.addArrangedSubview(logout)
        stackView.setCustomSpacing(10, after: logout)
       
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = false
        
    }
    
    @objc func LogoutBtnClicked(_ sender: UIButton) {
        if let accessToken = AccessToken.current{
            AccessToken.current = nil
            let myLogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let loginDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            loginDelegate.window?.rootViewController = myLogin
            //let myLogin = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            //self.present(myLogin!, animated: true, completion: nil)
        }
    }
    
    @objc func editConnectBtnClicked(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(identifier: "PartnerConnectionController") as? PartnerConnectionController
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @objc func EraseBtnClicked(_ sender: UIButton) {
        var erase_url = URLComponents(string: "http://127.0.0.1:8000/erase_data")!
        let session = URLSession.shared
        erase_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username)]
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = session.dataTask(with: erase_url.url!, completionHandler: {data, response, error in
            print(response)
            print(data)
            semaphore.signal()
        })
        task.resume()
        
        semaphore.wait()
        
        if let accessToken = AccessToken.current{
            AccessToken.current = nil
            let myLogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let loginDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            loginDelegate.window?.rootViewController = myLogin
            //let myLogin = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            //self.present(myLogin!, animated: true, completion: nil)
        }
    }
}

