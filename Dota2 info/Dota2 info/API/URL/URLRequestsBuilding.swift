//
//  URLRequestsBuilding.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//
import Foundation

public protocol URLRequestsBuilding {
    func buildURLRequest(
        url: URL,
        query: QueryItemsRepresentable?,
        method: HTTPMethod
    ) throws -> URLRequest
}

public enum HTTPMethod: String {
    case get
    case post
}
