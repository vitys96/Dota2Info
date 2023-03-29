//
//  APIURLRequestsBuilder.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public protocol RequestDecorator {
    func decorate(_ request: inout URLRequest)
}


public struct APIURLRequestsBuilder {
    // тут можно хранить clientToken
    private let requestDecorators: [RequestDecorator]
    private let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: "98f636fb183748f9845eb2f65b988383")
    
    // MARK: Init
    
    public init(
        requestDecorators: [RequestDecorator] = []
    ) {
        self.requestDecorators = requestDecorators
    }
}

extension APIURLRequestsBuilder: URLRequestsBuilding {
    public func buildURLRequest(
        url: URL,
        query: QueryItemsRepresentable?,
        method: HTTPMethod
    ) throws -> URLRequest {
        var completedURL = url
        
        if let query = query {
            // добавляем URLQueryItem
            var items = query.queryItems()
            items.append(apiKeyQueryItem)
            completedURL = try url.appendedURL(queryItems: items)
        }
        
        var request = URLRequest(
            url: completedURL
        )
        request.httpMethod = method.rawValue
        
        return request
        
    }
    
    private func addCommonHeaders(
        _ request: inout URLRequest
    ) throws {
        // если есть токен, читаем его
        // let clientToken = "Token =\(clientToken)"
        //request.setValue(clientToken, forHTTPHeaderField: HTTPHeader.authorization)
        
        // добавляем заголовки какие нибудь
        
        requestDecorators.forEach { $0.decorate(&request) }
    }

}
