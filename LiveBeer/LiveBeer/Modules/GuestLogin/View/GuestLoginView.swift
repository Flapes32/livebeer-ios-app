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
                    .frame(height: geometry.safeAreaInsets.top + AppSpacing.xxl + min(geometry.size.height * 0.15, 120))
                
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
                        .scaledToFill()
                        .frame(
                            width: min(geometry.size.width * 0.35, 133),
                            height: min(geometry.size.height * 0.3, 234)
                        )
                    Spacer()
                }
                .padding(.bottom, 60 + AppSpacing.sm + geometry.safeAreaInsets.bottom)
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
                        .scaledToFill()
                        .frame(
                            width: min(geometry.size.width * 0.55, 218),
                            height: min(geometry.size.height * 0.35, 290)
                        )
                }
                .padding(.horizontal, AppSpacing.xl)
                .padding(.bottom, 60 + AppSpacing.sm + geometry.safeAreaInsets.bottom)
            }
        }
    }

    // MARK: - Tab Bar

    private var tabBarView: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    MainTabBarView(selectedTab: Binding(
                        get: { viewModel.selectedTab },
                        set: { viewModel.didSelectTab($0) }
                    ))
                    if geometry.safeAreaInsets.bottom > 0 {
                        Color.black
                            .frame(height: geometry.safeAreaInsets.bottom)
                    }
                }
            }
        }
    }
}

#Preview("iPhone 15") {
    GuestLoginConfigurator.make(output: nil)
}
