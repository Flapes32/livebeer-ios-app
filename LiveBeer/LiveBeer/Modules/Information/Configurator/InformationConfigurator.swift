import SwiftUI

enum InformationConfigurator {
    static func make(output: InformationOutput?, selectedTab: Binding<Int>) -> InformationView {
        let viewModel = InformationViewModel(output: output)

        return InformationView(viewModel: viewModel, selectedTab: selectedTab)
    }
}
