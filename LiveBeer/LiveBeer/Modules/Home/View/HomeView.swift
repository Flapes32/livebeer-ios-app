import SwiftUI

struct HomeView: View {
    // MARK: - Properties

    @ObservedObject private var viewModel: HomeViewModel

    // MARK: - Init

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views

    var body: some View {
        VStack(spacing: 0) {
            TabContainerView(viewModel: viewModel)
            MainTabBarView(selectedTab: Binding(
                get: { viewModel.selectedTab },
                set: { viewModel.didSelectTab($0) }
            ))
        }
        .background(AppColors.background)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeConfigurator.make(output: nil)
}

