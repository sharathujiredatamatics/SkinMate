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
    var id: [String] = ["01","02","03","04","05","06"]
    var name: [String] = ["Craig A.Mohney","David.Semier","En Agestin Rose","Jessica E.Liggett","Joseph K.Jose","Mary E.Jensen"]
    var qualification: [String] = ["MD FAAD,FASMS","MD FAAD","MD FAAD FASMS","MD,FAAD","MD FAAD FASMS","MD FAAD FASMS"]
    var doctorImages: [UIImage] = [ UIImage(named: "Doctor1")!,UIImage(named: "Doctor2")!,UIImage(named: "Doctor3")!,UIImage(named: "Doctor4")!,UIImage(named: "Doctor5")!,UIImage(named: "Doctor6")!]
    var busySlots: [String] = ["10.00","02.00"]
    var busyDays: [String] = ["2021-05-23","2021-05-26"]
}
