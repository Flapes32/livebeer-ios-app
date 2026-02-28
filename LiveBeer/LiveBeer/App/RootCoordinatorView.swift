import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    private let configurator = AppConfigurator()

    var body: some View {
        VStack(spacing: 16) {
            contentView

            Divider()

            HStack(spacing: 12) {
                Button("Welcome") {
                    coordinator.toWelcome()
                }

                Button("Phone") {
                    coordinator.toPhoneInput()
                }

                Button("Home") {
                    coordinator.toHome()
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    @ViewBuilder
    private var contentView: some View {
        switch coordinator.currentRoute {
        case .welcome:
            configurator.makeWelcomeModule()
        case .phoneInput:
            configurator.makePhoneInputModule()
        case .home:
            configurator.makeHomeModule()
        }
    }
}

#Preview {
    RootCoordinatorView()
}
