//
//  ProfileResponse.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/14/23.
//

import Foundation

struct ProfileResponse: Decodable {
    
    let id: Int
    let email: String
    let name: String
    let role: String
    let avatar: String
    
}
