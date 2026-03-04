import SwiftUI

struct TextLink: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.bodySecondary)
                .foregroundStyle(AppColors.dark)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
        .accessibilityHint("Нажмите для выполнения действия")
    }
}

#Preview {
    TextLink(title: "Войти без регистрации") {}
        .padding()
}
