//
//  Varification.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
class SystemVerification {
    static let shared = SystemVerification()
    init() {
    }
    var deviceId = String()
    var userId = String()
    var userAgent = String()
    var tokenId = String()
    var requestId = String()
}

