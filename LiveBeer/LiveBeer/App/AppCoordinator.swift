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
    @Published private(set) var currentPhone: String?
    
    private let sessionStorage: SessionStorageProtocol
    
    init(sessionStorage: SessionStorageProtocol = SessionStorage()) {
        self.sessionStorage = sessionStorage
        
        if sessionStorage.isAuthorized {
            currentRoute = .home
            currentPhone = sessionStorage.phone
        } else {
            currentRoute = .welcome
        }
    }

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
    
    func logout() {
        sessionStorage.reset()
        currentPhone = nil
        currentRoute = .welcome
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
    
    func phoneInputDidSucceed(phone: String) {
        currentPhone = phone
        sessionStorage.phone = phone
        toActivationCode()
    }
    
    func phoneInputDidTapRegistration(phone: String) {
        currentPhone = phone
        sessionStorage.phone = phone
        toActivationCode()
    }
}

extension AppCoordinator: ActivationCodeOutput {
    func activationCodeDidTapBack() {
        toPhoneInput()
    }
    
    func activationCodeDidSucceed() {
        sessionStorage.isAuthorized = true
        if let phone = currentPhone {
            sessionStorage.phone = phone
        }
        toHome()
    }
}

extension AppCoordinator: HomeOutput {
    func homeDidSelectTab(_ tabIndex: Int) {
        // TODO: Implement
    }
    
    func homeDidTapNews(_ newsItem: NewsItem) {
      // TODO: Implement  
    }
}
