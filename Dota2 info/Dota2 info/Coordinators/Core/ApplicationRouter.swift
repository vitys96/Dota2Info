//
//  ApplicationRouter.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import UIKit

class ApplicationRouter: NSObject, UINavigationControllerDelegate {

    private weak var rootController: SystemNavigationController?
    private var listeners: [WeakReference<LifeCycleListener>] = []

    public init(
        rootController: SystemNavigationController?
    ) {
        self.rootController = rootController

        super.init()

        self.rootController?.delegate = self
    }
}

// MARK: - Routable

extension ApplicationRouter: Routable {

    func subscribe(_ listener: LifeCycleListener) {
        listeners.append(WeakReference(listener))
    }
    
    func setRootModule(_ module: Presentable, hideNavigationBar: Bool, animated: Bool) {
        rootController?.setViewControllers([module.toPresent], animated: animated)
        rootController?.setNavigationBarHidden(!hideNavigationBar, animated: animated)
    }
    
}
