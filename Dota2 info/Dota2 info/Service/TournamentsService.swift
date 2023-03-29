//
//  TournamentsService.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public protocol TournamentsServicing {
    func load() async throws -> RecipesResponse
}


final class TournamentsService: AbstractService {
    private let urlBuilder: URLBuilding
    private let requestBuilder: URLRequestsBuilding

    init(
        urlBuilder: URLBuilding,
        requestBuilder: URLRequestsBuilding,
        dataTaskBuilder: APIDataTasksBuilding
    ) {
        self.urlBuilder = urlBuilder
        self.requestBuilder = requestBuilder

        super.init(dataTaskBuilder: dataTaskBuilder)
    }
}

extension TournamentsService: TournamentsServicing {
    func load() async throws -> RecipesResponse {
        let query = RandomRecipesQuery(tags: "dessert", number: 4)
        let url = try urlBuilder.buildURL(methodPath: .random)
        
        return try await performRequest {
            try requestBuilder.buildURLRequest(url: url, query: query, method: .get)
        }
    }
    
}
