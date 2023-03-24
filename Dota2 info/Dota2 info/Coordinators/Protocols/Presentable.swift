//
//  Presentable.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import UIKit

/// Абстракция от UIKit'a
public protocol Presentable: AnyObject {
    var toPresent: UIViewController { get }
}

extension UIViewController: Presentable {
    public var toPresent: UIViewController { self }
}
