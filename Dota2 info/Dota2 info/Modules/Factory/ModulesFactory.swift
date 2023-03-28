//
//  ModulesFactory.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import SwiftUI

public final class ModulesFactory: ModulesFactoryProtocol {
    
    public init() {}

    public func makeTournaments() -> Presentable {
        return TournamentsConfigurator().configure()
    }
    
}
