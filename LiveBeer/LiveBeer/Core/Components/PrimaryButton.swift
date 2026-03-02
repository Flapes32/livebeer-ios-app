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
            .background(isEnabled ? AppColors.yellow : AppColors.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous))
        }
        .disabled(!isEnabled || isLoading)
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
