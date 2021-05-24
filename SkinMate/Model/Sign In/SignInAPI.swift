//
//  APICall.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API's  of SignIn module.
class SignInAPI{
    static let shared = SignInAPI()
    init() {
    }
    // SignIn API.
    let signInAPI = "https://skinmate.herokuapp.com/accounts/auth"
    // Fetch User Infromation API.
    let fetchUserAPI = "https://skinmate.herokuapp.com/accounts"
    // Verify Email API.
    let verifyEmail = "https://skinmate.herokuapp.com/accounts/verify/email"
    // Forgot password request API.
    let forgotPasswordRequest = "https://skinmate.herokuapp.com/accounts/auth/otp-signin"
    // Forgot password get OTP API.
    let forgotPasswordHandle = "https://skinmate.herokuapp.com/accounts/auth/otp-signin"
    
}
