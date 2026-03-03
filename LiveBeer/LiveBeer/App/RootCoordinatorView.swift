import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    private let phoneInputConfigurator = PhoneInputConfigurator()

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        switch coordinator.currentRoute {
        case .welcome:
            WelcomeConfigurator.make(output: coordinator)
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
