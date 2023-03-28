//
//  TournamentsConfigurator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import SwiftUI

final class TournamentsConfigurator {

    public init() {}

    func configure() -> Presentable {
        let view = TournamentsView()

        let wrappedView = UIHostingController(
            rootView: view
        )

        return wrappedView
    }
}
