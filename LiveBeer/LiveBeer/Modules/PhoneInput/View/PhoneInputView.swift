import SwiftUI

struct PhoneInputView: View {
    @StateObject private var viewModel: PhoneInputViewModel

    @FocusState private var isPhoneFieldFocused: Bool

    init(viewModel: PhoneInputViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BackButton(action: viewModel.didTapBack)
                .padding(.top, AppSpacing.md)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("Введите ваш\nномер телефона")
                    .font(AppTypography.titleLarge)
                    .foregroundStyle(AppColors.dark)

                Text("Мы вышлем вам проверочный код")
                    .font(AppTypography.bodyPrimary)
                    .foregroundStyle(AppColors.gray)
            }
            .padding(.top, AppSpacing.xl)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                TextField(
                    "+7 (913) 210 95 82",
                    text: Binding(
                        get: { viewModel.phoneText },
                        set: { viewModel.didChangePhone($0) }
                    )
                )
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

                if let errorText = viewModel.errorText {
                    Text(errorText)
                        .font(AppTypography.caption)
                        .foregroundStyle(.red)
                }
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
                    isEnabled: viewModel.isValid,
                    isLoading: viewModel.isLoading,
                    action: {
                        Task {
                            await viewModel.didTapContinue()
                        }
                    }
                )

                HStack(spacing: AppSpacing.xs) {
                    Text("У вас нет аккаунта?")
                        .font(AppTypography.bodySecondary)
                        .foregroundStyle(AppColors.gray)

                    Button(action: viewModel.didTapRegistration) {
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
    PhoneInputView(viewModel: PhoneInputViewModel(output: nil))
}

#Preview("iPhone SE (3rd generation)") {
    PhoneInputView(viewModel: PhoneInputViewModel(output: nil))
}
