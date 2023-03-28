//
//  Routable.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import Foundation

/// Интерфейс роутера для системы координаторов
public protocol Routable: AnyObject {
    ///  Push модуля
    /// - Parameters:
    ///   - module: модуль для операции
    ///   - transition: анимация перехода
    ///   - hideBottomBar: флаг скрыть/показать tabbar
    ///   - animated: флаг анимации
    ///   - completion: вызываемый блок после выполнения
    func pushModule(
        _ module: Presentable,
        hideBottomBar: Bool,
        animated: Bool,
        completion: (() -> Void)?
    )

    /// Установить root модуль
    /// - Parameters:
    ///   - module: модуль для установки
    ///   - transition: анимация перехода
    ///   - hideNavigationBar: флаг скрыть/показать navigationBar
    ///   - animated: флаг анимации
    func setRootModule(
        _ module: Presentable,
        hideNavigationBar: Bool,
        animated: Bool
    )

    /// Pop модуля
    /// - Parameters:
    ///   - transition: анимация перехода
    ///   - animated: флаг анимации
    ///   - completion: вызываемый блок после выполнения
    func popModule(animated: Bool, completion: (() -> Void)?)

    /// PopToRoot модуля, сбрасывает все текущие флоу до начального
    /// - Parameters:
    ///   - animated: флаг анимации
    ///   - completion: вызываемый блок после выполнения
    func popToRootModule(animated: Bool, completion: (() -> Void)?)

    /// Презентация модуля модально
    /// - Parameters:
    ///   - module: модулья для презентации
    ///   - animated: флаг анимации
    ///   - isModalInPresentation: Запрет на закрытие экрана свайпом вниз. Если `false` то свайп будет доступен
    ///   - completion: вызываемый блок после выполнения
    func presentModule(
        _ module: Presentable,
        animated: Bool,
        isModalInPresentation: Bool,
        completion: (() -> Void)?
    )

    /// Dismiss последнего модального модуля
    /// - Parameters:
    ///   - animated: флаг анимации
    ///   - completion: вызываемый блок после выполнения
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    /// Подписать на изменения сущность для контроля жизненного цикла
    /// - Parameter listener: слушатель
    func subscribe(_ listener: LifeCycleListener)
}

public extension Routable {
    func presentModule(
        _ module: Presentable,
        animated: Bool = true,
        isModalInPresentation: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        presentModule(
            module,
            animated: animated,
            isModalInPresentation: isModalInPresentation,
            completion: completion
        )
    }

    func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismissModule(animated: animated, completion: completion)
    }

    func popToRootModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        popToRootModule(animated: animated, completion: completion)
    }

    func pushModule(
        _ module: Presentable,
        hideBottomBar: Bool = false,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        pushModule(module, hideBottomBar: hideBottomBar, animated: animated, completion: completion)
    }

    func popModule(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        popModule(animated: animated, completion: completion)
    }

    func setRootModule(
        _ module: Presentable,
        hideNavigationBar: Bool = true,
        animated: Bool = true
    ) {
        setRootModule(
            module,
            hideNavigationBar: hideNavigationBar,
            animated: animated
        )
    }
}
