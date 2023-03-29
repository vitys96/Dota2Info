//
//  APIDataTasksBuilder.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public final class APIDataTasksBuilder {
    private let decoder: JSONDecoder
    private let session: URLSession
    
    public init(
        decoder: JSONDecoder,
        session: URLSession
    ) {
        self.decoder = decoder
        self.session = session
    }
}

extension APIDataTasksBuilder: APIDataTasksBuilding {
    public func buildDataTask<T: Decodable>(
        request: URLRequest
    ) async throws -> T {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ResponseError.notDetermined
        }
        
        // обработка ошибок
        if httpResponse.statusCode == 401 {
            throw ResponseError.emptyData
        }
        
        if data.isEmpty {
            throw ResponseError.emptyData
        }
        
        return try decoder.decode(T.self, from: data)
    }
}
