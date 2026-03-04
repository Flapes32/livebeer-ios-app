import SwiftUI

struct ActivationCodeView: View {
    @StateObject private var viewModel: ActivationCodeViewModel
    
    private let phone: String
    @FocusState private var isCodeFocused: Bool

    init(
        phone: String,
        viewModel: ActivationCodeViewModel
    ) {
        self.phone = phone
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            BackButton(action: viewModel.didTapBack)
                .padding(.top, AppSpacing.md)

            Text("Введите номер\nактивации")
                .font(AppTypography.titleLarge)
                .foregroundStyle(AppColors.dark)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, AppSpacing.xl)

            Text("Мы выслали его на номер \(phone)")
                .font(AppTypography.bodyPrimary)
                .foregroundStyle(AppColors.gray)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .padding(.top, AppSpacing.xs)

            ZStack(alignment: .leading) {
                TextField("", text: Binding(
                    get: { viewModel.codeText },
                    set: { viewModel.didChangeCode($0) }
                ))
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
                            Text(index < viewModel.codeDigits.count ? String(Array(viewModel.codeDigits)[index]) : "•")
                                .font(AppTypography.titleSmall)
                                .foregroundStyle(viewModel.errorText == nil ? AppColors.dark : .red)

                            Rectangle()
                                .fill(viewModel.errorText == nil ? AppColors.dark.opacity(0.3) : Color.red.opacity(0.7))
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { isCodeFocused = true }
            .padding(.top, AppSpacing.xl)

            if let errorText = viewModel.errorText {
                Text(errorText)
                    .font(AppTypography.caption)
                    .foregroundStyle(.red)
                    .padding(.top, AppSpacing.sm)
            }

            Spacer()

            VStack(spacing: AppSpacing.md) {
                PrimaryButton(
                    title: "Войти в систему",
                    isEnabled: viewModel.isSubmitEnabled,
                    isLoading: false,
                    action: viewModel.didTapSubmit
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
    ActivationCodeView(
        phone: "+7 (913) 210 ** **",
        viewModel: ActivationCodeViewModel(output: nil)
    )
}
