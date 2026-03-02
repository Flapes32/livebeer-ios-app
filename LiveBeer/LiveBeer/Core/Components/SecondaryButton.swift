import SwiftUI

struct SecondaryButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.button)
                .foregroundStyle(isEnabled ? AppColors.dark : AppColors.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(AppColors.surface)
                .overlay {
                    RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
                        .stroke(isEnabled ? AppColors.dark.opacity(0.15) : AppColors.gray.opacity(0.25), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    VStack(spacing: AppSpacing.md) {
        SecondaryButton(title: "Регистрация", isEnabled: true) {}
        SecondaryButton(title: "Регистрация", isEnabled: false) {}
    }
    .padding()
}
