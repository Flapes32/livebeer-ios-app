import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    private let phoneInputConfigurator = PhoneInputConfigurator()
    private let activationCodeConfigurator = ActivationCodeConfigurator()

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        switch coordinator.currentRoute {
        case .welcome:
            WelcomeConfigurator.make(output: coordinator)
        case .phoneInput:
            phoneInputConfigurator.make(output: coordinator)
        case .activationCode:
            activationCodeConfigurator.make(
                phone: "+7 (913) 210 ** **",
                expectedCode: "1111",
                output: coordinator
            )
        case .guestLogin:
            GuestLoginConfigurator.make(output: coordinator)
        case .home:
            HomeConfigurator.make(output: coordinator)
        }
    }
}
