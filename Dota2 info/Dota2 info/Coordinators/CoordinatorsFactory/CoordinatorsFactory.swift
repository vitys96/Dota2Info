//
//  CoordinatorsFactory.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import Foundation

protocol CoordinatorsFactoring {
    func makeTabBarCoordinator(
        router: Routable,
        parent: BaseCoordinator?
    ) -> AnyCoordinator<Void>
}

final class CoordinatorsFactory {
    
    init(
    ) {
    }
}

extension CoordinatorsFactory: CoordinatorsFactoring {
    func makeTabBarCoordinator(router: Routable, parent: BaseCoordinator?) -> AnyCoordinator<Void> {
        return AnyCoordinator(TabBarCoordinator(
            tabBarController: SystemTabBarController(),
            router: router,
            parent: parent
        ))
    }
    
}
