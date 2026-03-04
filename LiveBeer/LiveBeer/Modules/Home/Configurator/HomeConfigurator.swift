import SwiftUI

enum HomeConfigurator {
    static func make(output: HomeOutput?) -> HomeView {
        let viewModel = HomeViewModel(output: output)

        return HomeView(viewModel: viewModel)
    }
}
