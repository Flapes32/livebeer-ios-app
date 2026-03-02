import SwiftUI

struct ActivationCodeView: View {
    private let phone: String
    private let onBackTap: () -> Void

    @State private var codeText: String = ""
    @FocusState private var isCodeFocused: Bool

    init(phone: String, onBackTap: @escaping () -> Void = {}) {
        self.phone = phone
        self.onBackTap = onBackTap
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
                .padding(.top, AppSpacing.lg)

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
                                .foregroundStyle(AppColors.dark)

                            Rectangle()
                                .fill(AppColors.dark.opacity(0.3))
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { isCodeFocused = true }
            .onChange(of: codeText) { newValue in
                let digits = newValue.filter(\.isNumber)
                codeText = String(digits.prefix(4))
            }
            .padding(.top, AppSpacing.xl)

            Spacer()

            VStack(spacing: AppSpacing.md) {
                PrimaryButton(
                    title: "Войти в систему",
                    isEnabled: isSubmitEnabled,
                    isLoading: false,
                    action: {}
                )

                Text("Отправить код повторно можно через 00:47")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.gray)
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
