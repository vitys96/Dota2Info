//
//  RandomRecipesQuery.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public protocol QueryItemsRepresentable {
    func queryItems() -> [URLQueryItem]
}

struct RandomRecipesQuery: QueryItemsRepresentable {
    let tags: String
    let number: Int
    
    func queryItems() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        
        let tagsItem = URLQueryItem(name: "tags", value: tags)
        items.append(tagsItem)
        
        let numberItem = URLQueryItem(name: "number", value: String(number))
        items.append(numberItem)
        
        return items
    }
}
