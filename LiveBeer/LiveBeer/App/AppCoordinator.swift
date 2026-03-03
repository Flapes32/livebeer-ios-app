import SwiftUI

final class AppCoordinator: ObservableObject {
    enum Route {
        case welcome
        case phoneInput
        case activationCode
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
}

extension AppCoordinator: WelcomeOutput {
    func onLogin() {
        toPhoneInput()
    }
    
    func onRegistration() {
        toPhoneInput()
    }
    
    func onGuest() {
        toHome()
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
