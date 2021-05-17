//
//  APICall.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
class SignInAPI{
    static let shared = SignInAPI()
    init() {
}
    let signInAPI = "https://skinmate.herokuapp.com/accounts/auth"
    let fetchUserAPI = "https://skinmate.herokuapp.com/accounts"
    
    let verifyEmail = "https://skinmate.herokuapp.com/accounts/verify/email"
    let forgotPasswordRequest = "https://skinmate.herokuapp.com/accounts/auth/request-otp-signin"
    let forgotPasswordHandle = "https://skinmate.herokuapp.com/accounts/auth/otp-signin"

}
