import SwiftUI

struct TextLink: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTypography.caption)
                .foregroundStyle(AppColors.dark)
                .underline()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TextLink(title: "Войти без регистрации") {}
        .padding()
}
