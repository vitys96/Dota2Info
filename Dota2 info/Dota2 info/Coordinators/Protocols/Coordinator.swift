//
//  Coordinator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

public protocol Coordinator: AnyObject {
    associatedtype StartOption

    func start(with option: StartOption)
}

public final class AnyCoordinator<StartOption>: Coordinator {
    private let startWithOptionClosure: (StartOption) -> Void

    public init<T: Coordinator>(_ coordinator: T) where T.StartOption == StartOption {
        startWithOptionClosure = coordinator.start(with:)
    }

    public func start(with option: StartOption) {
        startWithOptionClosure(option)
    }
}

public extension AnyCoordinator where StartOption == Void {
    func start() {
        start(with: ())
    }
}
