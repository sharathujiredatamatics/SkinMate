//
//  AccountAPI.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
// API's  of Account section module.
class AccountAPI{
    static let shared = AccountAPI()
    init() {
    }
    // Logout API.
    let logoutAPI = "https://skinmate.herokuapp.com/accounts/auth"
    // User Upadte API.
    let userUpdate = "https://skinmate.herokuapp.com/accounts"
    // Fetch all family member API.
    let allFamilyMembers = "https://skinmate.herokuapp.com/accounts/family"
    // Adding family member API.
    let addFamily = "https://skinmate.herokuapp.com/accounts/family"
    // Update family member API.
    let updateFamily = "https://skinmate.herokuapp.com/accounts/family/"
    // Delete family member API.
    let deleteFamilymember = "https://skinmate.herokuapp.com/accounts/family/"
    // Upload profile picture API.
    let profilePicUpload = "https://skinmate.herokuapp.com/accounts/avatar"
    // Add insurance API.
    let addInsurance = "https://skinmate.herokuapp.com/appointments/insurance"
}
