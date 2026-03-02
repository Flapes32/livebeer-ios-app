import SwiftUI

struct WelcomeView: View {
    private let onLoginTap: () -> Void
    private let onRegistrationTap: () -> Void
    private let onGuestTap: () -> Void

    init(
        onLoginTap: @escaping () -> Void = {},
        onRegistrationTap: @escaping () -> Void = {},
        onGuestTap: @escaping () -> Void = {}
    ) {
        self.onLoginTap = onLoginTap
        self.onRegistrationTap = onRegistrationTap
        self.onGuestTap = onGuestTap
    }

    var body: some View {
        GeometryReader { proxy in
            let heroHeight = max(430, proxy.size.height * 0.63)

            VStack(spacing: 0) {
                Image("welcome_background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: heroHeight)
                    .clipped()

                VStack(spacing: AppSpacing.lg) {
                    Text("Программа\nлояльности для\nклиентов LiveBeer")
                        .multilineTextAlignment(.center)
                        .font(AppTypography.titleLarge)
                        .foregroundStyle(AppColors.dark)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, AppSpacing.md)

                    HStack(spacing: AppSpacing.sm) {
                        PrimaryButton(title: "Вход", isEnabled: true, isLoading: false, action: onLoginTap)
                        SecondaryButton(title: "Регистрация", isEnabled: true, action: onRegistrationTap)
                    }
                    .padding(.top, AppSpacing.sm)

                    TextLink(title: "Войти без регистрации", action: onGuestTap)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
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
