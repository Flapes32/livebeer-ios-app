import SwiftUI

enum StoresConfigurator {
    static func make(output: StoresOutput?, selectedTab: Binding<Int>) -> StoresView {
        let viewModel = StoresViewModel(output: output)

        return StoresView(viewModel: viewModel, selectedTab: selectedTab)
    }
}
