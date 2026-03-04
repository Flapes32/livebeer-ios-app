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
        Group {
            switch coordinator.currentRoute {
            case .welcome:
                WelcomeConfigurator.make(output: coordinator)
                    .id("welcome")
            case .phoneInput:
                phoneInputConfigurator.make(output: coordinator)
                    .id("phoneInput")
            case .activationCode:
                activationCodeConfigurator.make(
                    phone: coordinator.currentPhone ?? "+7 (913) 210 ** **",
                    expectedCode: "1111",
                    output: coordinator
                )
                .id("activationCode")
            case .guestLogin:
                GuestLoginConfigurator.make(output: coordinator)
                    .id("guestLogin")
            case .home:
                HomeConfigurator.make(output: coordinator)
                    .id("home")
            }
        }
        .animation(.easeInOut(duration: 0.3), value: coordinator.currentRoute)
    }
}
