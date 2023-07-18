//
//  Array.swift
//  My Nutrition
//
//  Created by Igna on 14/07/2023.
//

import Foundation

extension Array where Element == Day {
    func key() -> String {
        return self.first?.date().storageDate ?? ""
    }
}
