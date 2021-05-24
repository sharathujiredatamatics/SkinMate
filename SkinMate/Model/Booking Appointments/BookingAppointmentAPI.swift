//
//  BookingAppointmentAPI.swift
//  SkinMate
//
//  Created by techjini on 23/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation

class BookingAppointmentApi{
    
    static let shared = BookingAppointmentApi()
    
    let fetchDoctorapi = "https://skinmate.herokuapp.com/doctors"
    let postAppointmentApi = "https://skinmate.herokuapp.com/appointments"
}
