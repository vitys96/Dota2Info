//
//  ResponseError.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public enum ResponseError: Error {
    case noConnection
    case request(error: Error, url: URL?)
    case emptyData
    case notDetermined
}
