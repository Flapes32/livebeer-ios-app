import SwiftUI

struct GuestLoginView: View {
    
    // MARK: - Properties
    
    private let viewModel: GuestLoginViewModel
    
    // MARK: - Init
    
    init(viewModel: GuestLoginViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Views
    
    var body: some View {
        ZStack {
            backgroundView
            contentView
            tabBarView
        }
        .ignoresSafeArea()
}

    // MARK: - Background

    private var backgroundView: some View {
        VStack {
            backgroundImage
            Spacer()
        }
    }
    
    private var backgroundImage: some View {
        Image(Assets.Launch.background.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: 517, height: 590)
    }

    // MARK: - Content

    private var contentView: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 100)
            
            VStack(spacing: AppSpacing.lg) {
                titleView
                subtitleView
                loginButton
            }
            .padding(.horizontal, AppSpacing.lg)
            
            Spacer()
            
            handsIllustration
                .padding(.bottom, 120)
        }
    }

    private var titleView: some View {
        Text("Войдите в приложение")
            .font(.system(size: 34, weight: .bold))
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
    }

    private var subtitleView: some View {
        Text("Чтобы копить баллы и литры, вам надо авторизироваться в приложении")
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding(.horizontal, AppSpacing.md)
    }

    private var loginButton: some View {
        PrimaryButton(
            title: "Войти",
            isEnabled: true,
            isLoading: false,
            action: viewModel.didTapLogin
        )
        .padding(.horizontal, AppSpacing.xl)
        .padding(.top, AppSpacing.md)
    }

    private var handsIllustration: some View {
        Image(Assets.Launch.hands.rawValue)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 466, maxHeight: 270)
    }

    // MARK: - Tab Bar

    private var tabBarView: some View {
        VStack {
            Spacer()
            MainTabBarView(selectedTab: .constant(0))
        }
    }
}

#Preview("iPhone 15") {
    GuestLoginConfigurator.make(output: nil)
}
