//
//  MyAppointment.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

//
import UIKit
class MyAccountAPI{
    static let shared = MyAccountAPI()
    init() {
    }
    let fetchAllApointments = "https://skinmate.herokuapp.com/myappointments"
    let cancelApointment = "https://skinmate.herokuapp.com/appointment/cancel/"
    let rescheduleApointment = "https://skinmate.herokuapp.com/appointment/reschedule/"
  
}
