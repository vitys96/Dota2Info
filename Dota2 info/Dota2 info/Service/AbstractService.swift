//
//  AbstractService.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation
import Combine

public class AbstractService {
    private let dataTaskBuilder: APIDataTasksBuilding

    init(dataTaskBuilder: APIDataTasksBuilding) {
        self.dataTaskBuilder = dataTaskBuilder
    }

    func performRequest<Response: Decodable>(
        makeRequest: () throws -> URLRequest
    ) async throws -> Response {
        let request: URLRequest
        do {
            request = try makeRequest()
        } catch {
            throw ResponseError.noConnection
        }
        
        return try await self.dataTaskBuilder.buildDataTask(request: request)
        
        
//        let request: URLRequest
//
//        do {
//            request = try makeRequest()
//        } catch {
//            return Fail(error: error).eraseToAnyPublisher()
//        }
//
//        return Future { promise in
//            let completion: (Result<Response, ResponseError>) -> Void = { result in
//                switch result {
//                case let .success(response):
//                    promise(.success(response))
//                case let .failure(error):
//                    promise(.failure(error))
//                }
//            }
//
//            let dataTask = self.dataTaskBuilder.buildDataTask(
//                request: request,
//                completion: completion,
//                errorHandlingPolicy: errorHandlingPolicy,
//                function: function
//            )
//            dataTask.resume()
//        }
//        .eraseToAnyPublisher()
    }
}
