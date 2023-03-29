//
//  TournamentsCoordinator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import UIKit

final class TournamentsCoordinator: BaseCoordinator {

    // MARK: Init
    private let modulesFactory: ModulesFactoryProtocol

    public init(
        router: Routable,
        parent: BaseCoordinator?,
        modulesFactory: ModulesFactoryProtocol
    ) {
        self.modulesFactory = modulesFactory

        super.init(router: router, parent: parent)
    }
}

// MARK: - Coordinator

extension TournamentsCoordinator: Coordinator {
    public func start(with _: Void) {
        let module = modulesFactory.makeTournaments()
        module.input.bootstrap()
        router.setRootModule(module.view, animated: false)
    }
}
