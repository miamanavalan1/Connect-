//
//  ViewController.swift
//  Connect+
//
//  Created by Mia Manavalan on 2/3/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAddEvent(_ sender: Any) {
    
    let eventStore: EKEventStore = EKEventStore()
        
    eventStore.requestAccess(to: .event) { (granted, error) in
        
        if (granted) && (error == nil)
        {
            print("granted: \(granted)")
            print("error: \(error)")
            
            let event:EKEvent = EKEvent(eventStore: eventStore)
            event.title = "Go buy a pillow"
            event.startDate = Date()
            event.endDate = Date()
            event.notes = "Check pillow brands and quality"
            event.calendar = eventStore.defaultCalendarForNewEvents
            do {
                try eventStore.save(event, span: .thisEvent)
            }catch let error as NSError{
                print("error: \(error)")
            }
            print("Save Event!")
        }
        else{
            print("error: \(error)")
        }
        }
    }
}

