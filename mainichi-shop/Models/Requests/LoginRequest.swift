//
//  LoginRequest.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/14/23.
//

import Foundation


struct LoginRequest: Encodable {
    let email: String
    let password: String
}
