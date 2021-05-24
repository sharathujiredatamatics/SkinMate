//
//  SignIn.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
// Singleto class to store User Verification details.
class SignInAPICall{
    static let shared = SignInAPICall()
    init() {
    }
    var deviceId = String()
    var userId = String()
    var userAgent = String()
    var tokenId = String()
    var requestId = String()
}
