//
//  URLBuilder.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public enum URLError: Error {
    case cannotBeFormed
}

public protocol URLBuilding {
    func buildURL(methodPath: MethodPath) throws -> URL
}

struct URLBuilder: URLBuilding {
    func buildURL(methodPath: MethodPath) throws -> URL {
        var path = methodPath.path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        
        let urlString = "https://api.spoonacular.com" + path
        
        guard let methodURL = URL(string: urlString) else {
            throw URLError.cannotBeFormed
        }

        return methodURL
    }
}
