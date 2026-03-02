import SwiftUI

struct PhoneInputView: View {
    private let onBackTap: () -> Void
    private let onContinueTap: (String) -> Void
    private let onRegistrationTap: () -> Void

    @State private var phoneText: String = ""
    @FocusState private var isPhoneFieldFocused: Bool

    init(
        onBackTap: @escaping () -> Void = {},
        onContinueTap: @escaping (String) -> Void = { _ in },
        onRegistrationTap: @escaping () -> Void = {}
    ) {
        self.onBackTap = onBackTap
        self.onContinueTap = onContinueTap
        self.onRegistrationTap = onRegistrationTap
    }

    private var digitsCount: Int {
        phoneText.filter(\.isNumber).count
    }

    private var isContinueEnabled: Bool {
        digitsCount >= 10
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BackButton(action: onBackTap)
                .padding(.top, AppSpacing.md)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("Введите ваш\nномер телефона")
                    .font(AppTypography.titleLarge)
                    .foregroundStyle(AppColors.dark)

                Text("Мы вышлем вам проверочный код")
                    .font(AppTypography.bodyPrimary)
                    .foregroundStyle(AppColors.gray)
            }
            .padding(.top, AppSpacing.lg)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                TextField("+7 (913) 210 95 82", text: $phoneText)
                    .font(.system(size: 36, weight: .regular))
                    .foregroundStyle(AppColors.dark)
                    .keyboardType(.phonePad)
                    .focused($isPhoneFieldFocused)
                    .onTapGesture {
                        isPhoneFieldFocused = true
                    }
                    .padding(.top, AppSpacing.xl)

                Rectangle()
                    .fill(AppColors.gray.opacity(0.25))
                    .frame(height: 1)
            }
            .padding(.top, AppSpacing.md)

            Spacer()
        }
        .padding(.horizontal, AppSpacing.md)
        .background(AppColors.surface)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: AppSpacing.md) {
                PrimaryButton(
                    title: "Далее",
                    isEnabled: isContinueEnabled,
                    isLoading: false,
                    action: { onContinueTap(phoneText) }
                )

                HStack(spacing: AppSpacing.xs) {
                    Text("У вас нет аккаунта?")
                        .font(AppTypography.bodySecondary)
                        .foregroundStyle(AppColors.gray)

                    Button(action: onRegistrationTap) {
                        Text("Регистрация")
                            .font(AppTypography.bodySecondary)
                            .foregroundStyle(.blue)
                    }
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.top, AppSpacing.sm)
            .padding(.bottom, AppSpacing.md)
            .background(AppColors.surface)
        }
        .onAppear {
            DispatchQueue.main.async {
                isPhoneFieldFocused = true
            }
        }
    }
}

#Preview("iPhone 15") {
    PhoneInputView()
}

#Preview("iPhone SE (3rd generation)") {
    PhoneInputView()
}
