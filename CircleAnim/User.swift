//
//  User.swift
//  CircleAnim
//
//  Created by Nguyen Manh Hung on 4/17/21.
//

import Foundation

struct User {
    let username: String
    let password: String
    let email: String
    let address: String
    let job: String
    
    func publicInfo() -> [(title: String, value: String)] {
        return [
            (title: "Username", value: username),
            (title: "Email", value: email),
            (title: "Address", value: address),
            (title: "Job", value: job)
        ]
    }
}
