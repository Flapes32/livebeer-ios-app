import SwiftUI

enum WelcomeConfigurator {
    static func make(output: WelcomeOutput?) -> WelcomeView {
        let viewModel = WelcomeViewModel(output: output)

        return WelcomeView(viewModel: viewModel)
    }
}
