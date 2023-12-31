//
//  Constants.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 9/30/23.
//

import Foundation

class Constants {
    public static let loginController = "LoginController"
    public static let authNavigationController = "AuthNavigationController"
    public static let signupController = "SignupController"
    public static let tabController = "tabController"
    public static let profileController = "ProfileController"
    public static let createProductController = "CreateProductController"
    public static let addressController = "AddressController"
    public static let addAddressController = "AddAddressController"
    public static let tutorialController = "TutorialController"
    public static let tutorialContentController = "TutorialContentController"
}

class CellIdentifier {
    public static let searchCell = "SearchCell"
    public static let prouctCell = "ProductCell"
    public static let CategoryHolderCell = "CategoryHolderCell"
    public static let categoryCell = "CategoryCell"
    public static let collectionSectionHeaderView = "CollectionSectionHeaderView"
}
class RestClient {
    public static let baseUrl = "https://api.escuelajs.co"
    public static let categoryUrl = "/api/v1/categories"
    public static let loginURL = "/api/v1/auth/login"
    public static let profileUrl = "/api/v1/auth/profile"
    public static let photoUploadUrl = "/api/v1/files/upload"
}

class AppData {
    public static var addresses: [Address] = []
}
