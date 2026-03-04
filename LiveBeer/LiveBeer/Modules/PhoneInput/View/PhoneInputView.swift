import SwiftUI

struct PhoneInputView: View {
    @StateObject private var viewModel: PhoneInputViewModel

    @FocusState private var isPhoneFieldFocused: Bool

    init(viewModel: PhoneInputViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                BackButton(action: viewModel.didTapBack)
                    .padding(.top, AppSpacing.md)

                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("Введите ваш\nномер телефона")
                        .font(AppTypography.titleLarge)
                        .foregroundStyle(AppColors.dark)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Мы вышлем вам проверочный код")
                        .font(AppTypography.bodyPrimary)
                        .foregroundStyle(AppColors.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, AppSpacing.xl)

                GeometryReader { geometry in
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    TextField(
                        "+7 (913) 210 95 82",
                        text: Binding(
                            get: { viewModel.phoneText },
                            set: { viewModel.didChangePhone($0) }
                        )
                    )
                        .font(.system(size: min(geometry.size.width * 0.09, 36), weight: .regular))
                        .foregroundStyle(AppColors.dark)
                        .keyboardType(.phonePad)
                        .focused($isPhoneFieldFocused)
                        .onTapGesture {
                            isPhoneFieldFocused = true
                        }
                        .padding(.top, AppSpacing.xl)
                        .accessibilityLabel("Номер телефона")
                        .accessibilityHint("Введите ваш номер телефона")

                        Rectangle()
                            .fill(AppColors.gray.opacity(0.25))
                            .frame(height: 1)

                        if let errorText = viewModel.errorText {
                            Text(errorText)
                                .font(AppTypography.caption)
                                .foregroundStyle(.red)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .padding(.top, AppSpacing.md)
                }
                .frame(height: 100)

                Spacer()
                    .frame(height: 200)
            }
            .padding(.horizontal, AppSpacing.md)
        }
        .scrollDismissesKeyboard(.interactively)
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
        .preferredColorScheme(.light)
}

#Preview("iPhone SE") {
    PhoneInputView(viewModel: PhoneInputViewModel(output: nil))
        .preferredColorScheme(.light)
}

#Preview("iPhone 15 Dark") {
    PhoneInputView(viewModel: PhoneInputViewModel(output: nil))
        .preferredColorScheme(.dark)
}
