//
//  User.swift
//  LogOut
//
//  Created by Yaroslav on 22.11.2021.
//

import Foundation

struct User {
    let name: String
    let password: String
    
    static func getUserDate() -> User {
        User(name: "User", password: "Password")
    }
}
