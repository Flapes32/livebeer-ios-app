import SwiftUI

enum ProfileConfigurator {
    static func make(output: ProfileOutput?, selectedTab: Binding<Int>) -> ProfileView {
        let viewModel = ProfileViewModel(output: output)

        return ProfileView(viewModel: viewModel, selectedTab: selectedTab)
    }
}
