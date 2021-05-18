//
//  AppointmentsData.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

struct AppointmentsData: Codable {
    let date, time, doctorName, doctorEducation: String
    let appointmentid: String
}
