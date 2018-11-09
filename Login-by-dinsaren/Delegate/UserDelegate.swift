//
//  UserDelegate.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/8/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import Foundation

protocol UserDelegate {
    func loginSuccess(name:String)
    func signUpSeccess(name:String,password:Int)
}
