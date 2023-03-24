//
//  SystemNavigationController.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import UIKit

open class SystemNavigationController: UINavigationController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
        definesPresentationContext = false
        title = "dasd"
    }
}
