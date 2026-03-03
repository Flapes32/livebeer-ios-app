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
                        .font(.system(size: 42, weight: .bold))
                        .foregroundStyle(AppColors.surface)

                    Text("Накоплено баллов")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(AppColors.surface)

                    Text("Собирайте баллы\nи получайте бонусы")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(AppColors.gray)
                        .lineSpacing(1)
                }

                Spacer(minLength: AppSpacing.sm)

                ZStack(alignment: .topTrailing) {
                    Image("бокалы")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 124, height: 98)

                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundStyle(AppColors.yellow)
                        .offset(x: 4, y: -4)
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
