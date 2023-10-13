//
//  LoginResponse.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/14/23.
//

import Foundation

// turns into swift objectable
struct LoginResponse: Decodable {
    let access_token: String?
    let refresh_token: String?
    let statusCode: Int?
    let message: String?
}
