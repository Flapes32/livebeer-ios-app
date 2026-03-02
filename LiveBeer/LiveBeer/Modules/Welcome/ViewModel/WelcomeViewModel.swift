import Foundation

final class WelcomeViewModel {
    private let onLogin: () -> Void
    private let onRegistration: () -> Void
    private let onGuest: () -> Void

    init(
        onLogin: @escaping () -> Void = {},
        onRegistration: @escaping () -> Void = {},
        onGuest: @escaping () -> Void = {}
    ) {
        self.onLogin = onLogin
        self.onRegistration = onRegistration
        self.onGuest = onGuest
    }

    func didTapLogin() {
        onLogin()
    }

    func didTapRegistration() {
        onRegistration()
    }

    func didTapGuest() {
        onGuest()
    }
}
