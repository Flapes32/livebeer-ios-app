import SwiftUI

final class AppCoordinator: ObservableObject {
    enum Route {
        case welcome
        case phoneInput
        case activationCode
        case guestLogin
        case home
    }

    @Published private(set) var currentRoute: Route = .welcome

    func openWelcomeScreen() {
        currentRoute = .welcome
    }

    func toPhoneInput() {
        currentRoute = .phoneInput
    }

    func toHome() {
        currentRoute = .home
    }

    func toActivationCode() {
        currentRoute = .activationCode
    }

    func toGuestLogin() {
        currentRoute = .guestLogin
    }
}

extension AppCoordinator: WelcomeOutput {
    func onLogin() {
        toPhoneInput()
    }
    
    func onRegistration() {
        toPhoneInput()
    }
    
    func onGuest() {
        toGuestLogin()
    }
}

extension AppCoordinator: GuestLoginOutput {
    func guestLoginDidTapLogin() {
        toPhoneInput()
    }
}

extension AppCoordinator: PhoneInputOutput {
    func phoneInputDidTapBack() {
        openWelcomeScreen()
    }
    
    func phoneInputDidSucceed() {
        toActivationCode()
    }
    
    func phoneInputDidTapRegistration() {
        toActivationCode()
    }
}

extension AppCoordinator: ActivationCodeOutput {
    func activationCodeDidTapBack() {
        toPhoneInput()
    }
    
    func activationCodeDidSucceed() {
        toHome()
    }
}

extension AppCoordinator: HomeOutput {
    func homeDidSelectTab(_ tabIndex: Int) {
        
    }
    
    func homeDidTapNews(_ newsItem: NewsItem) {
        
    }
}
