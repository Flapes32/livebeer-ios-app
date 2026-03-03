import Foundation

final class WelcomeViewModel {
    // MARK: - Properties

    private weak var output: WelcomeOutput?

    // MARK: - Init

    init(output: WelcomeOutput?) {
        self.output = output
    }

    // MARK: - Internal Methods

    func didTapLogin() {
        output?.onLogin()
    }

    func didTapRegistration() {
        output?.onRegistration()
    }

    func didTapGuest() {
        output?.onGuest()
    }
}
