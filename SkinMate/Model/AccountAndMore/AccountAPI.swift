//
//  AccountAPI.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
class AccountAPI{
    static let shared = AccountAPI()
    init() {
    }
    let logoutAPI = "https://skinmate.herokuapp.com/accounts/auth"
    let userUpdate = "https://skinmate.herokuapp.com/accounts"
    let allFamilyMembers = "https://skinmate.herokuapp.com/familymember/all"
    let addFamily = "https://skinmate.herokuapp.com/familymember"
    let updateFamily = "https://skinmate.herokuapp.com/familymember/"
    let deleteFamilymember = "https://skinmate.herokuapp.com/familymember/"
    let profilePicUpload = "https://skinmate.herokuapp.com/accounts/avatar"
}
