import SwiftUI

enum GuestLoginConfigurator {
    static func make(output: GuestLoginOutput?) -> GuestLoginView {
        let viewModel = GuestLoginViewModel(output: output)

        return GuestLoginView(viewModel: viewModel)
    }
}
