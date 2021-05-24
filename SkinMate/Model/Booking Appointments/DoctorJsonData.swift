//
//  DoctorJsonData.swift
//  BookAppointments
//
//  Created by techjini on 11/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
// MARK: - DoctorElement
struct DoctorElement: Decodable{
    let id, name, email, phone: String
    let qualification: String
    let busySlots: [BusySlot]
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, phone, qualification, busySlots
        case v = "__v"
    }
}

// MARK: - BusySlot
struct BusySlot: Decodable {
    let time: [String]
    let id, date: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case id = "_id"
        case date
    }
}



