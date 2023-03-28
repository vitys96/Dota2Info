//

import Combine
import Foundation
import SMUIKit
import SMModulesInfrastructure

final class ___VARIABLE_productName:identifier___Presenter {

    // MARK: Dependencies

    private let interactor: ___VARIABLE_productName:identifier___Interacting
    private let viewState: ___VARIABLE_productName:identifier___ViewState
    private weak var output: ___VARIABLE_productName:identifier___Output?

    // MARK: Environment

    private var subscriptions = Set<AnyCancellable>()

    // MARK: Init

    init(
        interactor: ___VARIABLE_productName:identifier___Interacting,
        viewState: ___VARIABLE_productName:identifier___ViewState,
        output: ___VARIABLE_productName:identifier___Output
    ) {
        self.interactor = interactor
        self.viewState = viewState
        self.output = output
    }

    // MARK: Private
}

// MARK: - ___VARIABLE_productName:identifier___ViewOutput

extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___ViewOutput {}

// MARK: - ___VARIABLE_productName:identifier___Input

extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___Input {}

// MARK: - SystemHostingControllerDelegate

extension ___VARIABLE_productName:identifier___Presenter: SystemHostingControllerDelegate {}
