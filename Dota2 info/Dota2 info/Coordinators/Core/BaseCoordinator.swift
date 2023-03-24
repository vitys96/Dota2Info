//
//  BaseCoordinator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import Foundation

class BaseCoordinator {
    private enum LocalConstants {
        static let applicationCoordinator = "ApplicationCoordinator"
    }

    /// Роутер координатора
    public let router: Routable

    /// Родительский координатор
    private weak var parentCoordinator: BaseCoordinator?

    /// Дочерние координаторы
    private var childCoordinators: [BaseCoordinator] = []

    /// Свойство позволяет понять как показан координатор, из коробки или нет
    private var isStartingWithCoordinator = false

    /// Свойство позволяет считать кол-во юнитов в координаторе
    public private(set) var countUnits: Int = 0

    init(router: Routable, parent: BaseCoordinator?) {
        self.router = router
        self.router.subscribe(self)

        parentCoordinator = parent
        parent?.addDependency(self)
    }
}

// MARK: - LifeCycleListener

extension BaseCoordinator: LifeCycleListener {
    public func increment() {
        if countUnits == 0 {
            parentCoordinator?.addDependency(self)
        }
        countUnits += 1
    }
    
    public func decrement() {
        countUnits -= 1
        
        if countUnits == 0 {
            parentCoordinator?.removeDependency(self)
        }
    }
    
    // MARK: Private

    private func addDependency(_ coordinator: BaseCoordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }

        isStartingWithCoordinator = countUnits == 0
        childCoordinators.append(coordinator)
    }

    private func removeDependency(_ coordinator: BaseCoordinator) {
        childCoordinators.removeAll { $0 === coordinator }

        if childCoordinators.isEmpty, countUnits == 0 {
            parentCoordinator?.removeDependency(self)
        }
    }
    
}
