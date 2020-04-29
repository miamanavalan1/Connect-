//
//  LogInEmailViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/28/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class LogInEmailViewController: UIViewController {

    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        var emptytitle: UILabel!
        emptytitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 35))
        emptytitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emptytitle.text = "Sign Up"
        emptytitle.textAlignment = .center
        emptytitle.font = UIFont(name: "Marvel-Bold", size: 40.0)
        emptytitle.textColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        var pagetitle: UILabel!
        pagetitle = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height: 110))
        pagetitle.heightAnchor.constraint(equalToConstant: 110).isActive = true
        pagetitle.text = "Log In"
        pagetitle.textAlignment = .center
        pagetitle.font = UIFont(name: "Marvel-Bold", size: 40.0)
        pagetitle.textColor = UIColor.darkGray
        

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27)
        
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(emptytitle)
        stackView.addArrangedSubview(pagetitle)
        

        var subtitle1: UILabel!
        subtitle1 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle1.textAlignment = .left
        subtitle1.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle1.textColor = UIColor.darkGray
        subtitle1.text = "User ID or Email:"
        
        let useID =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        useID.heightAnchor.constraint(equalToConstant: 40).isActive = true
        useID.font = UIFont(name: "Assistant-Regular", size: 20)
        useID.textColor = UIColor.darkGray
        useID.borderStyle = UITextField.BorderStyle.roundedRect
        useID.autocorrectionType = UITextAutocorrectionType.no
        useID.keyboardType = UIKeyboardType.default
        useID.returnKeyType = UIReturnKeyType.done
        useID.clearButtonMode = UITextField.ViewMode.whileEditing
        useID.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        var subtitle3: UILabel!
        subtitle3 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle3.textAlignment = .left
        subtitle3.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle3.textColor = UIColor.darkGray
        subtitle3.text = "Password:"

        let pwd =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        pwd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //lastname.placeholder = "Partner's user ID..."
        pwd.font = UIFont(name: "Assistant-Regular", size: 20)
        pwd.textColor = UIColor.darkGray
        pwd.borderStyle = UITextField.BorderStyle.roundedRect
        pwd.autocorrectionType = UITextAutocorrectionType.no
        pwd.keyboardType = UIKeyboardType.default
        pwd.returnKeyType = UIReturnKeyType.done
        pwd.clearButtonMode = UITextField.ViewMode.whileEditing
        pwd.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        pwd.isSecureTextEntry = true
        
        let SignInBtn = privacyButton(titleString: "Sign In")
        let GoBackBtn2 = EraseButton(titleString: "Go Back")
        GoBackBtn2.addTarget(self, action: #selector(GoBackBtnClicked(_:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(subtitle1)
        stackView.addArrangedSubview(useID)
        //stackView.setCustomSpacing(40, after: firstname)
        //stackView.setCustomSpacing(40, after: lastname)
        stackView.addArrangedSubview(subtitle3)
        stackView.addArrangedSubview(pwd)
        stackView.setCustomSpacing(40, after: pwd)
        
        stackView.addArrangedSubview(SignInBtn)
        stackView.addArrangedSubview(GoBackBtn2)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = false
    }
    
    @IBAction func GoBackBtnClicked(_ sender: Any) {
        
        let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let tbDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        tbDelegate.window?.rootViewController = LoginViewController
    }
}

