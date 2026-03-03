import SwiftUI

struct BackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.xs) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .semibold))
                Text("Назад")
                    .font(AppTypography.bodySecondary)
            }
            .foregroundStyle(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BackButton {}
        .padding()
}
