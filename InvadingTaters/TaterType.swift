//
//  TaterType.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/21/22.
//

import Foundation

enum TaterType {
    case irrit
    case wide
    case conc
    
    static func byRow(_ row: Int) -> TaterType {
        if (row <= 2) {
            return .conc
        } else if (row <= 4) {
            return .wide
        }
        return .irrit
    }
    
    var imageName: String {
        switch (self) {
        case .irrit:
            return "irrit"
        case .wide:
            return "wide"
        case .conc:
            return "concernedtater"
        }
    }
}
