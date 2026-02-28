import SwiftUI

final class AppCoordinator: ObservableObject {
    enum Route {
        case welcome
        case phoneInput
        case home
    }

    @Published private(set) var currentRoute: Route = .welcome

    func toWelcome() {
        currentRoute = .welcome
    }

    func toPhoneInput() {
        currentRoute = .phoneInput
    }

    func toHome() {
        currentRoute = .home
    }
}
