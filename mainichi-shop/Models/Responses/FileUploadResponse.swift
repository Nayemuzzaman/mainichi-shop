//
//  FileUploadResponse.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/14/23.
//

import Foundation

struct FileUploadResponse: Decodable {
    
     let originalname : String
     let filename: String
     let location: String
    
}
