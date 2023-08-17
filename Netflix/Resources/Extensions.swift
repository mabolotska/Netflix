//
//  Extensions.swift
//  Netflix
//
//  Created by Maryna Bolotska on 15/08/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
