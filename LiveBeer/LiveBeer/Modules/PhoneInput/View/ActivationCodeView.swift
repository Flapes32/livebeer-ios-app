import SwiftUI

struct ActivationCodeView: View {
    private let phone: String
    private let expectedCode: String
    private let onBackTap: () -> Void
    private let onSubmitSuccess: () -> Void

    @State private var codeText: String = ""
    @State private var errorText: String?
    @FocusState private var isCodeFocused: Bool

    init(
        phone: String,
        expectedCode: String = "1111",
        onBackTap: @escaping () -> Void = {},
        onSubmitSuccess: @escaping () -> Void = {}
    ) {
        self.phone = phone
        self.expectedCode = expectedCode
        self.onBackTap = onBackTap
        self.onSubmitSuccess = onSubmitSuccess
    }

    private var codeDigits: String {
        String(codeText.filter(\.isNumber).prefix(4))
    }

    private var isSubmitEnabled: Bool {
        codeDigits.count == 4
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BackButton(action: onBackTap)
                .padding(.top, AppSpacing.md)

            Text("Введите номер\nактивации")
                .font(AppTypography.titleLarge)
                .foregroundStyle(AppColors.dark)
                .padding(.top, AppSpacing.xl)

            Text("Мы выслали его на номер \(phone)")
                .font(AppTypography.bodyPrimary)
                .foregroundStyle(AppColors.gray)
                .padding(.top, AppSpacing.xs)

            ZStack(alignment: .leading) {
                TextField("", text: $codeText)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isCodeFocused)
                .foregroundStyle(.clear)
                .tint(.clear)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .opacity(0.02)

                HStack(spacing: AppSpacing.md) {
                    ForEach(0..<4, id: \.self) { index in
                        VStack(spacing: AppSpacing.xs) {
                            Text(index < codeDigits.count ? String(Array(codeDigits)[index]) : "•")
                                .font(AppTypography.titleSmall)
                                .foregroundStyle(errorText == nil ? AppColors.dark : .red)

                            Rectangle()
                                .fill(errorText == nil ? AppColors.dark.opacity(0.3) : Color.red.opacity(0.7))
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { isCodeFocused = true }
            .onChange(of: codeText) { _, newValue in
                let digits = newValue.filter(\.isNumber)
                codeText = String(digits.prefix(4))
                errorText = nil
            }
            .padding(.top, AppSpacing.xl)

            if let errorText {
                Text(errorText)
                    .font(AppTypography.caption)
                    .foregroundStyle(.red)
                    .padding(.top, AppSpacing.sm)
            }

            Spacer()

            VStack(spacing: AppSpacing.md) {
                PrimaryButton(
                    title: "Войти в систему",
                    isEnabled: isSubmitEnabled,
                    isLoading: false,
                    action: {
                        if codeDigits == expectedCode {
                            onSubmitSuccess()
                        } else {
                            errorText = "Неверный код"
                        }
                    }
                )

                TextLink(title: "Отправить код повторно", action: {})
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom, AppSpacing.md)
        }
        .padding(.horizontal, AppSpacing.md)
        .background(AppColors.surface)
        .onAppear {
            DispatchQueue.main.async {
                isCodeFocused = true
            }
        }
    }
}

#Preview {
    ActivationCodeView(phone: "+7 (913) 210 ** **")
}
