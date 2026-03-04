import Foundation

final class GuestLoginViewModel {
    // MARK: - Properties

    private weak var output: GuestLoginOutput?

    // MARK: - Init

    init(output: GuestLoginOutput?) {
        self.output = output
    }

    // MARK: - Internal Methods

    func didTapLogin() {
        output?.guestLoginDidTapLogin()
    }
}
