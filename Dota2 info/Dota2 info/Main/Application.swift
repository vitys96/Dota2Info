//
//  Application.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import UIKit

protocol ApplicationProtocol: AnyObject {
    func start()
}

open class Application: ApplicationProtocol {
    private weak var window: ApplicationWindow?
    private let tabBarCoordinator: AnyCoordinator<Void>

    init(window: inout ApplicationWindow?) {
        window = ApplicationWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let dependencyFactory = DependencyFactory()
        let coordinatorsFactory = CoordinatorsFactory(modulesFactory: ModulesFactory(dependencies: dependencyFactory))


        guard let rootSystem = window?.rootViewController as? SystemNavigationController else {
            fatalError("rootSystem cannot be nil")
        }

        tabBarCoordinator = coordinatorsFactory.makeTabBarCoordinator(
            router: ApplicationRouter(rootController: rootSystem),
            parent: nil
        )
    }
    
    func start() {
        window?.makeKeyAndVisible()
        tabBarCoordinator.start()
        
    }
}

final class ApplicationWindow: UIWindow {
    override init(frame: CGRect) {
        super.init(frame: frame)
        rootViewController = SystemNavigationController()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
