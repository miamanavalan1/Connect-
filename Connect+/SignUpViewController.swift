//
//  SignUpViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/28/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

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
        pagetitle.text = "Sign Up"
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
        subtitle1.text = "Name:"
        
        let name =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        name.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //firstname.placeholder = "Firs..."
        name.font = UIFont(name: "Assistant-Regular", size: 20)
        name.textColor = UIColor.darkGray
        name.borderStyle = UITextField.BorderStyle.roundedRect
        name.autocorrectionType = UITextAutocorrectionType.no
        name.keyboardType = UIKeyboardType.default
        name.returnKeyType = UIReturnKeyType.done
        name.clearButtonMode = UITextField.ViewMode.whileEditing
        name.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        /*var subtitle2: UILabel!
        subtitle2 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle2.textAlignment = .left
        subtitle2.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle2.textColor = UIColor.darkGray
        subtitle2.text = "Last Name:"

        let lastname =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        lastname.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //lastname.placeholder = "Partner's user ID..."
        lastname.font = UIFont(name: "Assistant-Regular", size: 20)
        lastname.textColor = UIColor.darkGray
        lastname.borderStyle = UITextField.BorderStyle.roundedRect
        lastname.autocorrectionType = UITextAutocorrectionType.no
        lastname.keyboardType = UIKeyboardType.default
        lastname.returnKeyType = UIReturnKeyType.done
        lastname.clearButtonMode = UITextField.ViewMode.whileEditing
        lastname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center*/
        
        var subtitle3: UILabel!
        subtitle3 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle3.textAlignment = .left
        subtitle3.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle3.textColor = UIColor.darkGray
        subtitle3.text = "Email:"

        let email =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //lastname.placeholder = "Partner's user ID..."
        email.font = UIFont(name: "Assistant-Regular", size: 20)
        email.textColor = UIColor.darkGray
        email.borderStyle = UITextField.BorderStyle.roundedRect
        email.autocorrectionType = UITextAutocorrectionType.no
        email.keyboardType = UIKeyboardType.default
        email.returnKeyType = UIReturnKeyType.done
        email.clearButtonMode = UITextField.ViewMode.whileEditing
        email.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        var subtitle4: UILabel!
        subtitle4 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle4.textAlignment = .left
        subtitle4.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle4.textColor = UIColor.darkGray
        subtitle4.text = "Password:"
        
        let password =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //lastname.placeholder = "Partner's user ID..."
        password.font = UIFont(name: "Assistant-Regular", size: 20)
        password.textColor = UIColor.darkGray
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.clearButtonMode = UITextField.ViewMode.whileEditing
        password.isSecureTextEntry = true
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        var subtitle5: UILabel!
        subtitle5 = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 20))
        subtitle5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subtitle5.textAlignment = .left
        subtitle5.font = UIFont(name: "Marvel-Bold", size: 20.0)
        subtitle5.textColor = UIColor.darkGray
        subtitle5.text = "Confirm Password:"
        
        let confirmpwd =  UITextField(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        confirmpwd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //lastname.placeholder = "Partner's user ID..."
        confirmpwd.font = UIFont(name: "Assistant-Regular", size: 20)
        confirmpwd.textColor = UIColor.darkGray
        confirmpwd.borderStyle = UITextField.BorderStyle.roundedRect
        confirmpwd.autocorrectionType = UITextAutocorrectionType.no
        confirmpwd.keyboardType = UIKeyboardType.default
        confirmpwd.returnKeyType = UIReturnKeyType.done
        confirmpwd.clearButtonMode = UITextField.ViewMode.whileEditing
        confirmpwd.isSecureTextEntry = true
        confirmpwd.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        let SignUpBtn2 = privacyButton(titleString: "Sign Up")
        let GoBackBtn = EraseButton(titleString: "Go Back")
        GoBackBtn.addTarget(self, action: #selector(GoBackBtnClicked(_:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(subtitle1)
        stackView.addArrangedSubview(name)
        //stackView.setCustomSpacing(40, after: firstname)
        //stackView.setCustomSpacing(40, after: lastname)
        stackView.addArrangedSubview(subtitle3)
        stackView.addArrangedSubview(email)
        //stackView.setCustomSpacing(40, after: email)
        stackView.addArrangedSubview(subtitle4)
        stackView.addArrangedSubview(password)
        //stackView.setCustomSpacing(40, after: password)
        stackView.addArrangedSubview(subtitle5)
        stackView.addArrangedSubview(confirmpwd)
        stackView.setCustomSpacing(40, after: confirmpwd)
        
        stackView.addArrangedSubview(SignUpBtn2)
        stackView.addArrangedSubview(GoBackBtn)
        
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


