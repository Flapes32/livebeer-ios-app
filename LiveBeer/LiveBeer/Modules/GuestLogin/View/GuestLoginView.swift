import SwiftUI

struct GuestLoginView: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: GuestLoginViewModel
    
    // MARK: - Init
    
    init(viewModel: GuestLoginViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Views
    
    var body: some View {
        ZStack {
            backgroundView
            contentView
            leftIllustration
            rightIllustration
            tabBarView
        }
        .background(AppColors.background)
        .ignoresSafeArea()
    }

    // MARK: - Background

    private var backgroundView: some View {
        GeometryReader { geometry in
            VStack {
                Image(Assets.Launch.background.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 1.3, height: geometry.size.height * 0.65)
                    .clipped()
                    .offset(y: -geometry.size.height * 0.1)
                Spacer()
            }
        }
    }

    // MARK: - Content

    private var contentView: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: geometry.safeAreaInsets.top + AppSpacing.xxl + 120)
                
                VStack(spacing: AppSpacing.lg) {
                    titleView
                    subtitleView
                    loginButton
                }
                .padding(.horizontal, AppSpacing.xl)
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
        }
    }

    private var titleView: some View {
        Text("Войдите в приложение")
            .font(AppTypography.titleLarge)
            .foregroundStyle(AppColors.dark)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
    }

    private var subtitleView: some View {
        Text("Чтобы копить баллы и литры, вам надо авторизироваться в приложении")
            .font(AppTypography.bodyPrimary)
            .foregroundStyle(AppColors.dark)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .padding(.horizontal, AppSpacing.sm)
    }

    private var loginButton: some View {
        PrimaryButton(
            title: "Войти",
            isEnabled: true,
            isLoading: false,
            action: viewModel.didTapLogin
        )
        .padding(.top, AppSpacing.sm)
    }

    private var leftIllustration: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Image(Assets.Points.left.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 133, height: 234)
                    Spacer()
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom + 60)
            }
        }
    }
    
    private var rightIllustration: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(Assets.Points.right.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 218, height: 290)
                }
                .padding(.horizontal, AppSpacing.xl)
                .padding(.bottom, geometry.safeAreaInsets.bottom + 60)
            }
        }
    }

    // MARK: - Tab Bar

    private var tabBarView: some View {
        VStack {
            Spacer()
            MainTabBarView(selectedTab: Binding(
                get: { viewModel.selectedTab },
                set: { viewModel.didSelectTab($0) }
            ))
        }
    }
}

#Preview("iPhone 15") {
    GuestLoginConfigurator.make(output: nil)
}
