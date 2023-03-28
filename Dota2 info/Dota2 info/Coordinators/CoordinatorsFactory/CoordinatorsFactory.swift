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
    
    func makeTournamentsCoordinator(parent: BaseCoordinator)
        -> (view: Presentable, coordinator: AnyCoordinator<Void>)
}

final class CoordinatorsFactory {
    
    private let modulesFactory: ModulesFactoryProtocol

    init(
        modulesFactory: ModulesFactoryProtocol
    ) {
        self.modulesFactory = modulesFactory
    }
}

extension CoordinatorsFactory: CoordinatorsFactoring {
    func makeTabBarCoordinator(router: Routable, parent: BaseCoordinator?) -> AnyCoordinator<Void> {
        return AnyCoordinator(TabBarCoordinator(
            tabBarController: SystemTabBarController(),
            coordinatorsFactory: self,
            router: router,
            parent: parent
        ))
    }
    
    func makeTournamentsCoordinator(parent: BaseCoordinator) -> (view: Presentable, coordinator: AnyCoordinator<Void>) {
        let navigationController = SystemNavigationController()
        let coordinator = TournamentsCoordinator(
            router: ApplicationRouter(rootController: navigationController),
            parent: parent,
            modulesFactory: modulesFactory
        )

        return (navigationController, AnyCoordinator(coordinator))
    }
    
}
