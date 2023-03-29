//
//  ModulesFactory.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import SwiftUI

public final class ModulesFactory: ModulesFactoryProtocol {
    
    private let dependencies: DependencyFactoryProtocol
    
    public init(dependencies: DependencyFactoryProtocol) {
        self.dependencies = dependencies
    }

    public func makeTournaments() -> ConcreteModule<TournamentsInput>  {
        return TournamentsConfigurator(dependencies: dependencies).configure()
    }
    
}
