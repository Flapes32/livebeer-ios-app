import SwiftUI

struct CardContainer<Content: View>: View {
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(AppSpacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.surface)
            .clipShape(RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous))
    }
}

#Preview {
    CardContainer {
        VStack(alignment: .leading, spacing: AppSpacing.xs) {
            Text("Накоплено баллов")
                .font(AppTypography.titleSmall)
                .foregroundStyle(AppColors.dark)
            Text("Собирайте баллы и получайте бонусы")
                .font(AppTypography.bodyPrimary)
                .foregroundStyle(AppColors.gray)
        }
    }
    .padding()
    .background(AppColors.background)
}
