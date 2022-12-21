//
//  TaterType.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/21/22.
//

import Foundation

enum TaterType {
    case regular
    case wide
    case ioa
    
    static var size: CGSize {
        return CGSize(width: 24, height: 16)
    }
}
