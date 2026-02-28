import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()

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
            Text("Welcome")
                .font(.title)
        case .phoneInput:
            Text("Phone")
                .font(.title)
        case .home:
            Text("Home")
                .font(.title)
        }
    }
}

#Preview {
    RootCoordinatorView()
}
