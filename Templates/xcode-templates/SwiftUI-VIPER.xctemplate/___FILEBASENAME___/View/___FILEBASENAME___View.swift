//

import SwiftUI

struct ___VARIABLE_productName:identifier___View: View {
    private let output: ___VARIABLE_productName:identifier___ViewOutput
    @ObservedObject private var state: ___VARIABLE_productName:identifier___ViewState
    
    init(output: ___VARIABLE_productName:identifier___ViewOutput, state: ___VARIABLE_productName:identifier___ViewState) {
        self.output = output
        self.state = state
    }
    
    var body: some View {
        VStack.zeroSpacing {
            Text("Hello, World!")
        }
    }
}
