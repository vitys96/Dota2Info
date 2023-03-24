//
//  LifeCycleListener.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import Foundation
/// Интерфейс слушателя жизненного цикла юнитов в координаторах
public protocol LifeCycleListener: AnyObject {
    /// Сообщает о увеличении
    func increment()

    /// Сообщает об уменьшении
    func decrement()
}
