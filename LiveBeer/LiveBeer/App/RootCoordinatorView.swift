import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        contentView
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
