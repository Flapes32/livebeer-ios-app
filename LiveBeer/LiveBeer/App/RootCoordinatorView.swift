import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    private let welcomeConfigurator = WelcomeConfigurator()
    private let phoneInputConfigurator = PhoneInputConfigurator()

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        switch coordinator.currentRoute {
        case .welcome:
            welcomeConfigurator.make(
                onLogin: coordinator.toPhoneInput,
                onRegistration: coordinator.toPhoneInput,
                onGuest: coordinator.toHome
            )
        case .phoneInput:
            phoneInputConfigurator.make(
                onBack: coordinator.openWelcomeScreen,
                onSuccess: coordinator.toActivationCode
            )
        case .activationCode:
            ActivationCodeView(
                phone: "+7 (913) 210 ** **",
                expectedCode: "1111",
                onBackTap: coordinator.toPhoneInput,
                onSubmitSuccess: coordinator.toHome
            )
        case .home:
            HomeView()
        }
    }
}
