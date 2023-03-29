//
//  TournamentsConfigurator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import SwiftUI

final class TournamentsConfigurator {

    private let dependencies: DependencyFactoryProtocol
    
    init(dependencies: DependencyFactoryProtocol) {
        self.dependencies = dependencies
    }

    func configure() -> ConcreteModule<TournamentsInput> {
        let view = TournamentsView()
        
        let presenter = TournamentsPresenter(service: dependencies.tournamentsService)

        let wrappedView = UIHostingController(
            rootView: view
        )

        return (wrappedView, presenter)
    }
}
