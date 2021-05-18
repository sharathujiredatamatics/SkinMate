//
//  ComformationAppointmentDetails.swift
//  BookAppointments
//
//  Created by techjini on 13/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//
import Foundation

class ComformAppointmentDetails{
    static let shared = ComformAppointmentDetails()
    var service: String = "nil"
    var doctorname: String = "nil"
    var doctorid: String = "nil"
    var doctorQualification = "nil"
    var date: String = "nil"
    var time: [String] = []
    var payingType: String = "nil"
    var insuranceInfo: String = "nil"
    var appointmentfor: String = "Self"
    var remainingTime: String = "nil"
}
