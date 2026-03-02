import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    private let welcomeConfigurator = WelcomeConfigurator()

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
            Text("Phone")
                .font(.title)
        case .home:
            Text("Home")
                .font(.title)
        }
    }
}
