//
//  MethodPath.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public enum MethodPath {
    case random
    
    var path: String {
        switch self {
        case .random:
            return "recipes/random"
        }
    }
}
