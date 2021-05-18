//
//  FamilyData.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct FamilyMembersData: Decodable {
    let _id, user, firstName, lastName: String
    let relationship, gender, dateOfBirth, bloodGroup: String
    let address, insurance, emergencyName, emergencyNumber: String
    let __v: Int
//    enum CodingKeys: String, CodingKey {
//        case _id
//        case user, firstName, lastName, relationship, gender, dateOfBirth, bloodGroup, address, insurance, emergencyName, emergencyNumber
//        case __v
//    }
}
