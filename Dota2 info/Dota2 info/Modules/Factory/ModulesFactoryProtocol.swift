//
//  ModulesFactoryProtocol.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

public typealias ConcreteModule<T> = (view: Presentable, input: T)

public protocol ModulesFactoryProtocol {
    func makeTournaments(
    ) -> ConcreteModule<TournamentsInput>
}
