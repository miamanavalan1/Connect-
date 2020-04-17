//
//  ViewController.swift
//  Connect+
//
//  Code for calendar logic: https://github.com/StergRi/Calendar
//
//  Code for tap gesture: https://www.youtube.com/watch?v=jY9t5rX8wHE
//
//  Code for btnAddEvent: https://www.youtube.com/watch?v=sSFzcvvs4Oc&t=545s

import UIKit
import EventKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var imageArray = [UIImage(named: "pregnant 1"), UIImage(named: "pregnant 2")]
    
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
        MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()
        
        configureTextFields()
        configureTapGesture()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        DateField.inputView = datePicker
        
        datePicker2 = UIDatePicker()
        datePicker2?.datePickerMode = .dateAndTime
        datePicker2?.addTarget(self, action: #selector(ViewController.dateChanged2(datePicker:)), for: .valueChanged)
        EndDateField.inputView = datePicker2
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
    
    @IBOutlet weak var DateField: UITextField!
    
    @IBOutlet weak var EndDateField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    private var datePicker2: UIDatePicker?
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        DateField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func dateChanged2(datePicker: UIDatePicker){
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMM d, h:mm a"
           EndDateField.text = dateFormatter.string(from: datePicker.date)
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
                    let event:EKEvent = EKEvent(eventStore: eventStore)
                    DispatchQueue.main.async {
                        event.title = "\(self.EventTitle.text!)"
                        event.notes = "\(self.EventNotes.text!)"
                        event.startDate = self.datePicker?.date
                        event.endDate = self.datePicker2?.date
                    }
                    
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    do {
                        try eventStore.save(event, span: .thisEvent)
                    }catch let error as NSError{
                        print("error: \(error)")
                    }
                }
            }
    }

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Success!", message: "Event Saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearAllField(_ sender: Any) {
        self.EventTitle.text = ""
        self.EventNotes.text = ""
        self.DateField.text = ""
        self.EndDateField.text = ""
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

