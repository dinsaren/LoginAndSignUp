//
//  UserSignUpDelegate.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/9/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import Foundation
protocol UserSignUpDelegate {
    func storeUserSignUp(name: String, pass: String)
}
