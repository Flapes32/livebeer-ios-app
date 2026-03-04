import Foundation

final class GuestLoginViewModel: ObservableObject {
    // MARK: - Properties

    @Published var selectedTab: Int = 0
    
    private weak var output: GuestLoginOutput?

    // MARK: - Init

    init(output: GuestLoginOutput?) {
        self.output = output
    }

    // MARK: - Internal Methods

    func didTapLogin() {
        output?.guestLoginDidTapLogin()
    }
    
    func didSelectTab(_ tabIndex: Int) {
        selectedTab = tabIndex
    }
}
