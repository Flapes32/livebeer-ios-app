import SwiftUI

struct PointsCard: View {
    let loyaltyInfo: LoyaltyInfo

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous)
                .fill(Color.black)

            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: AppSpacing.xxs) {
                    Text("\(loyaltyInfo.currentPoints)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(AppColors.surface)

                    Text("Накоплено баллов")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(AppColors.surface)

                    Text("Собирайте баллы\nи получайте бонусы")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(AppColors.gray)
                        .lineSpacing(1)
                }

                Spacer(minLength: AppSpacing.sm)

                ZStack(alignment: .topTrailing) {
                    Image("бокалы")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 146, height: 112)

                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(AppColors.yellow)
                        .offset(x: 6, y: -6)
                }
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, AppSpacing.sm)
        }
        .frame(height: 132)
    }
}

#Preview {
    PointsCard(loyaltyInfo: .mock)
        .padding()
        .background(AppColors.background)
}
