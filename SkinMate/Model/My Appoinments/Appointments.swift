//
//  Appointments.swift
//  SkinMate
//
//  Created by techjini on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation

struct Appointments: Codable {
    let date, time, doctorName, doctorEducation: String
    let appointmentid: String
}

