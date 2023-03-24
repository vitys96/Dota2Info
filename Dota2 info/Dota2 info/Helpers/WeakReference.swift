//
//  WeakReference.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

public protocol WeakReferencing {
    associatedtype Value

    var object: Value? { get set }
}

public final class WeakReference<T>: WeakReferencing {
    private weak var _value: AnyObject?

    public var object: T? {
        get {
            return _value as? T
        }
        set {
            guard let value = newValue else {
                _value = nil
                return
            }

            if isObject(value) {
                _value = newValue as AnyObject
            } else {
                _value = nil
            }
        }
    }

    private func isObject(_ val: Any) -> Bool {
        return type(of: val) is AnyObject.Type
    }

    public init(_ value: T?) {
        object = value
    }

    public static func == (lhs: WeakReference, rhs: WeakReference) -> Bool {
        return lhs._value === rhs._value
    }
}

public extension Array where Element: WeakReferencing {
    /// Removes elements with nil object
    mutating func reap() {
        self = filter { $0.object != nil }
    }

    /// Last element with not-nil object
    var lastWithObject: Element? {
        return last(where: { $0.object != nil })
    }
}
