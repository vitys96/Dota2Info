//
//  TournamentsPresenter.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 28.03.2023.
//

import Foundation

public protocol TournamentsInput: AnyObject {
    func bootstrap()
}

final class TournamentsPresenter {
    private let service: TournamentsServicing
    
    private var loadingTask: Task<Void, Never>?
    
    init(
        service: TournamentsServicing
    ) {
        self.service = service
    }
    
    private func loadAs() {
        loadingTask = Task {
            do {
                let kak = try await service.load()
                print(kak)

            } catch {
                //обработка ошибок
            }
        }
    }
}

extension TournamentsPresenter: TournamentsInput {
    func bootstrap() {
        loadAs()
    }
}
