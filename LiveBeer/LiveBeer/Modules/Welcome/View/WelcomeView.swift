import SwiftUI

struct WelcomeView: View {
    private let viewModel: WelcomeViewModel

    init(viewModel: WelcomeViewModel = WelcomeViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            let heroHeight = max(390, proxy.size.height * 0.58)

            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    AppColors.background
                    Image("welcome_background")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .frame(maxWidth: .infinity)
                .frame(height: heroHeight)

                VStack(spacing: AppSpacing.md) {
                    Text("Программа\nлояльности для\nклиентов LiveBeer")
                        .multilineTextAlignment(.center)
                        .font(AppTypography.titleSmall)
                        .foregroundStyle(AppColors.dark)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, AppSpacing.lg)

                    HStack(spacing: AppSpacing.sm) {
                        PrimaryButton(title: "Вход", isEnabled: true, isLoading: false, action: viewModel.didTapLogin)
                        SecondaryButton(title: "Регистрация", isEnabled: true, action: viewModel.didTapRegistration)
                    }

                    TextLink(title: "Войти без регистрации", action: viewModel.didTapGuest)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColors.surface)
                        .overlay {
                            RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
                                .stroke(AppColors.dark.opacity(0.12), lineWidth: 1)
                        }
                        .padding(.bottom, max(AppSpacing.md, proxy.safeAreaInsets.bottom))
                }
                .padding(.horizontal, AppSpacing.md)
                .frame(maxWidth: .infinity)
                .background(AppColors.surface)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(AppColors.surface)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview("iPhone 15") {
    WelcomeView()
}

#Preview("iPhone SE (3rd generation)") {
    WelcomeView()
}
