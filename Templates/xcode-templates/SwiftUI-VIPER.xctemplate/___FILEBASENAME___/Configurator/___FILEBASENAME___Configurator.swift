//

import SMUIKit
import SMModulesInfrastructure

final class ___VARIABLE_productName:identifier___Configurator {
    func configure(output: ___VARIABLE_productName:identifier___Output) -> ConcreteModule<___VARIABLE_productName:identifier___Input> {
        let viewState = ___VARIABLE_productName:identifier___ViewState()
        
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        
        let presenter = ___VARIABLE_productName:identifier___Presenter(
            interactor: interactor,
            viewState: viewState,
            output: output
        )
        
        let view = ___VARIABLE_productName:identifier___View(output: presenter, state: viewState)
        
        let wrappedView = SystemHostingController(rootView: view)
        wrappedView.delegate = presenter
        
        return (wrappedView, presenter)
    }
}
