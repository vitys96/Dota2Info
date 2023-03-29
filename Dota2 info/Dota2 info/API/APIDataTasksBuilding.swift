//
//  APIDataTasksBuilding.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public protocol APIDataTasksBuilding {
    func buildDataTask<T: Decodable>(
        request: URLRequest
    ) async throws -> T
}
