import SwiftUI

struct WelcomeConfigurator {
    func make(
        onLogin: @escaping () -> Void,
        onRegistration: @escaping () -> Void,
        onGuest: @escaping () -> Void
    ) -> WelcomeView {
        let viewModel = WelcomeViewModel(
            onLogin: onLogin,
            onRegistration: onRegistration,
            onGuest: onGuest
        )

        return WelcomeView(viewModel: viewModel)
    }
}
