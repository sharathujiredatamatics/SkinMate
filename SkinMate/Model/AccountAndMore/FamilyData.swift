//
//  FamilyData.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation

// Family member structure.
struct FamilyMembersData: Decodable {
    let _id,firstName, lastName: String
    let relationship, gender, dateOfBirth : String
    //    enum CodingKeys: String, CodingKey {
    //        case _id
    //        case user, firstName, lastName, relationship, gender, dateOfBirth, bloodGroup, address, insurance, emergencyName, emergencyNumber
    //        case __v
    //    }
}
