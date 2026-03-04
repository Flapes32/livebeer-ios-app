import SwiftUI

struct PrimaryButton: View {
    let title: String
    let isEnabled: Bool
    let isLoading: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Text(title)
                    .font(AppTypography.button)
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .tint(AppColors.dark)
                }
            }
            .foregroundStyle(AppColors.dark)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(isEnabled ? AppColors.yellow : AppColors.yellow.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous))
        }
        .disabled(!isEnabled || isLoading)
        .animation(.easeInOut(duration: 0.2), value: isEnabled)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
        .accessibilityLabel(title)
        .accessibilityHint(isLoading ? "Загрузка" : isEnabled ? "Нажмите для выполнения действия" : "Кнопка недоступна")
    }
}

#Preview {
    VStack(spacing: AppSpacing.md) {
        PrimaryButton(title: "Вход", isEnabled: true, isLoading: false) {}
        PrimaryButton(title: "Вход", isEnabled: false, isLoading: false) {}
        PrimaryButton(title: "Вход", isEnabled: true, isLoading: true) {}
    }
    .padding()
}
