//
//  ProfileViewController.swift
//  Connect+
//
//  Created by lujiaan on 4/19/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit

class InfoButton : UIButton {
    required init(titleString : String) {
        
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9631050229, green: 0.8972646594, blue: 0.8682072759, alpha: 1)
        tintColor = .darkGray
        frame.size = CGSize(width: 332, height: 60)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        setTitle(titleString, for: .normal)
        contentHorizontalAlignment = .left
        titleLabel?.font =  UIFont(name: "Assistant-Bold", size: 25)
        //setImage(UIImage(systemName: "arrow.right"), for: .normal)
        setImage(UIImage(named: "chevron.right.2"), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 20, left: 292, bottom: 20, right: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

