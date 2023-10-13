//
//  StringExtension.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/13/23.
//

import Foundation

extension String {
    func isValidEmail () -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)

    }

    func isValidPassword () -> Bool {
        return self.count > 5
    }
}
