//
//  DoctorDetails.swift
//  BookAppointments
//
//  Created by techjini on 16/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
import UIKit

class DoctorDetails{
    static let shared = DoctorDetails()
    
    var service: String = "nil"
    var id: [String] = []
    var name: [String] = []
    var qualification: [String] = []
    var doctorImages: [UIImage] = [ UIImage(named: "Doctor1")!,UIImage(named: "Doctor2")!,UIImage(named: "Doctor3")!]
    var busySlots: [String] = []
    var busyDays: [String] = []
}
