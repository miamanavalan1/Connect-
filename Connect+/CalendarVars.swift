//
//  CalendarVars.swift
//  Connect+
//
//  Created by lujiaan on 3/25/20.
//  Copyright © 2020 Mia Manavalan. All rights reserved.
//
//  code reference: https://github.com/StergRi/Calendar

import Foundation


let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day , from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
 
