
//
//  UserDetails.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
class UserDetails{
    static let shared = UserDetails()
    init() {
}
    //let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
    //let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
    var userId = String()
    var email = String()
    var phone = String()
    var firstName = String()
    var lastName = String()
    var gender = String()
    var dateOfBirth  = String()
    var bloodGroup = String()
    var address = String()
    var insurance = String()
    var emergencyName = String()
    var emergencyNumber = String()
    var elevatedAccess = Bool()
    var phoneVerified = Bool()
    var emailVerified = Bool()
    var createdAt = Date()
    var updatedAt = Date()
    var __v = Int()
}

struct UserDetailsD {
    let userId : String
    let email : String
    let phone : String
    let firstName : String
    let lastName : String
    let gender : String
    let dateOfBirth : String
    let bloodGroup : String
    let address : String
    let insurance : String
    let emergencyName : String
    let emergencyNumber : String
    let elevatedAccess : Bool
    let phoneVerified : Bool
    let emailVerified : Bool
    let createdAt : Date
    let updatedAt : Date
    let __v : Int
}
