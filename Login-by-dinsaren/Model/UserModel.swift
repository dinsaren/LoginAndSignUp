//
//  UserModel.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/8/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import Foundation
import UIKit
class UserModel {
    var username:String
    var password:String
    init(name: String,password: String) {
        self.username = name
        self.password = password
    }
   static var userList = [UserModel]()
}
