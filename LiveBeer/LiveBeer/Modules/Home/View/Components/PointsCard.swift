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
                    HStack(spacing: 0) {
                        Image(Assets3.Points.left.rawValue)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 60)
                        
                        Image(Assets3.Points.right.rawValue)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 120)
                    }

                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundStyle(AppColors.yellow)
                        .offset(x: 20, y: -0.5)
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
enum Assets3 {
    enum Points: String {
        case left = "Points/left"
        case right = "Points/right"
    }
}
