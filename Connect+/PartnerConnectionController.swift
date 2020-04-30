//
//  PartnerConnectionController.swift
//  Connect+
//
//  Created by lujiaan on 4/28/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class AccountButton : UIButton {
    required init(titleString : String){
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PartnerConnectionController: UIViewController, UITextFieldDelegate {

    var stackView = UIStackView()
    var user_id2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        var pagetitle: UILabel!
        pagetitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 110))
        pagetitle.heightAnchor.constraint(equalToConstant: 110).isActive = true
        pagetitle.text = "Connection"
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
        

        var subtitle1: UILabel!
        subtitle1 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        subtitle1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subtitle1.textAlignment = .left
        subtitle1.font = UIFont(name: "Marvel-Bold", size: 25.0)
        subtitle1.textColor = UIColor.darkGray
        subtitle1.text = "Your unique user ID:"
        
        let user_id1 = AccountButton(titleString: "    Facebook_Martha0123")
        
        var subtitle2: UILabel!
        subtitle2 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 25))
        subtitle2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subtitle2.textAlignment = .left
        subtitle2.font = UIFont(name: "Marvel-Bold", size: 25.0)
        subtitle2.textColor = UIColor.darkGray
        subtitle2.text = "Enter your partner's user ID:"

        user_id2 =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        user_id2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        user_id2.placeholder = "Partner's user ID..."
        user_id2.font = UIFont(name: "Assistant-Regular", size: 20)
        user_id2.textColor = UIColor.darkGray
        user_id2.borderStyle = UITextField.BorderStyle.roundedRect
        user_id2.autocorrectionType = UITextAutocorrectionType.no
        user_id2.keyboardType = UIKeyboardType.default
        user_id2.returnKeyType = UIReturnKeyType.done
        user_id2.clearButtonMode = UITextField.ViewMode.whileEditing
        user_id2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        let ConnectBtn = privacyButton(titleString: "Connect Now")
        ConnectBtn.addTarget(self, action: #selector(ConnectBtnClicked(_:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(subtitle1)
        stackView.addArrangedSubview(user_id1)
        stackView.setCustomSpacing(40, after: user_id1)
        stackView.addArrangedSubview(subtitle2)
        stackView.addArrangedSubview(user_id2)
        stackView.setCustomSpacing(40, after: user_id2)
        stackView.addArrangedSubview(ConnectBtn)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = false
    }
    
    @objc func ConnectBtnClicked(_ sender: UIButton) {
        
        if user_id2 != nil {
            /*
            var add_partner_url = URLComponents(string: "http://127.0.0.1:8000/add_partner")!
            let session = URLSession.shared
            add_partner_url.queryItems = [URLQueryItem(name: "unique_username", value: unique_username), URLQueryItem(name: "partner_name", value: user_id2.text)]
            struct rst: Decodable{
                let message: String
            }
            var alerttext = ""
            let semaphore = DispatchSemaphore(value: 0)
            let task = session.dataTask(with: add_partner_url.url!, completionHandler: {data, response, error in
                let result: rst = try! JSONDecoder().decode(rst.self, from: data!)
                alerttext = result.message
                semaphore.signal()
            })
            task.resume()
            
            semaphore.wait()
            
            if alerttext == "You are now connected!" {
                let next = storyboard?.instantiateViewController(identifier: "ConnectAlertController") as? ConnectAlertController
                self.navigationController?.pushViewController(next!, animated: true)
            } else {
                let alertController: UIAlertController
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController = UIAlertController(title: "Invalid Id", message: "Please enter your partner's Id shown on his/her profile page.", preferredStyle: .alert)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
            */
            
            let next = storyboard?.instantiateViewController(identifier: "ConnectAlertController") as? ConnectAlertController
            self.navigationController?.pushViewController(next!, animated: true)
        } else {
            let alertController: UIAlertController
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController = UIAlertController(title: "Empty Id", message: "Please enter your partner's Id shown on his/her profile page.", preferredStyle: .alert)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}


