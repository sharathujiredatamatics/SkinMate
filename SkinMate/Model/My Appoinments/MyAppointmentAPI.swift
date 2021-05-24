//
//  MyAppointment.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

//
import UIKit
// API's  of MyAppointment module.
class MyAppointmentAPI{
    static let shared = MyAppointmentAPI()
    init() {
    }
    // Fetch all appointment API.
    let fetchAllApointments = "https://skinmate.herokuapp.com/appointments"
    // Cancel an appointment API.
    let cancelApointment = "https://skinmate.herokuapp.com/appointments/"
    // Reschedule an appointment API.
    let rescheduleApointment = "https://skinmate.herokuapp.com/appointment/reschedule/"
}
