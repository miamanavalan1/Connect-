//
//  ViewController.swift
//  Connect+
//
//  Created by Mia Manavalan on 2/3/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//
//  calendar interface code reference: https://github.com/StergRi/Calendar

//  btnAddEvent code reference: https://www.youtube.com/watch?v=sSFzcvvs4Oc&t=545s

//  TextField code reference: https://www.youtube.com/watch?v=jY9t5rX8wHE

import UIKit
import EventKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var MonthLabel: UILabel!
    
    @IBOutlet weak var Calendar: UICollectionView!
    
    let Months = ["Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"]
    
    let DaysOfMonth = ["Monday","Thuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    var LeapYearCounter = 2
    
    var dayCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        //MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()
        configureTextFields()
        configureTapGesture()
    }
        
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }

    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "Dec":
            Direction = 1

            month = 0
            year += 1
            
            if LeapYearCounter  < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5{
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            month += 1

            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
          
            Calendar.reloadData()
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "Jan":
            Direction = -1

            month = 11
            year -= 1
            
            if LeapYearCounter > 0{
                LeapYearCounter -= 1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter = 4
            }else{
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            Direction = -1

            month -= 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        cell.DateLabel.textColor = UIColor.black
        
        cell.Circle.isHidden = true
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {      //the first cells that needs to be hidden (if needed) will be negative or zero so we can hide them
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DateLabel.text!)! < 1{ //here we hide the negative numbers or zero
            cell.isHidden = true
        }
        
        switch indexPath.row { //weekend days color
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - NumberOfEmptyBox == day{
            cell.Circle.isHidden = false
            cell.DrawCircle()
            
        }
        return cell
    }

    
    @IBOutlet weak var EventTitle: UITextField!
    
    @IBOutlet weak var EventNotes: UITextField!
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        print("Handle tap was called!")
        view.endEditing(true)
    }
    
    private func configureTextFields(){
        EventTitle.delegate = self
        EventNotes.delegate = self
    }
    
    @IBAction func btnAddEvent(_ sender: Any) {
        
        view.endEditing(true)
    
        let eventStore: EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            
            if (granted) && (error == nil)
            {
                print("granted: \(granted)")
                print("error: \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                DispatchQueue.main.async {
                    event.title = "\(self.EventTitle.text!)"
                    event.notes = "\(self.EventNotes.text!)"
                }
                event.startDate = Date()
                event.endDate = Date()
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

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

