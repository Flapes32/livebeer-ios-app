import SwiftUI

struct PointsCard: View {
    // MARK: - Properties

    let loyaltyInfo: LoyaltyInfo

    // MARK: - Views

    var body: some View {
        ZStack {
            backgroundCard
            contentView
        }
        .frame(height: 132)
    }

    // MARK: - Background

    private var backgroundCard: some View {
        RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous)
            .fill(Color.black)
    }

    // MARK: - Content

    private var contentView: some View {
        HStack(alignment: .bottom) {
            textInfoView
            Spacer(minLength: AppSpacing.sm)
            handsImageView
        }
        .padding(.horizontal, AppSpacing.md)
        .padding(.vertical, AppSpacing.sm)
    }

    // MARK: - Text

    private var textInfoView: some View {
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
    }

    // MARK: - Images

    private var handsImageView: some View {
        ZStack(alignment: .topTrailing) {
            handsRow
            questionMarkIcon
        }
    }

    private var handsRow: some View {
        HStack(spacing: 0) {
            leftHandImage
            rightHandImage
        }
    }

    private var leftHandImage: some View {
        Image(Assets3.Points.left.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: 70, height: 60)
    }

    private var rightHandImage: some View {
        Image(Assets3.Points.right.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: 110, height: 120)
    }

    private var questionMarkIcon: some View {
        Image(systemName: "questionmark.circle.fill")
            .font(.system(size: 30, weight: .semibold))
            .foregroundStyle(AppColors.yellow)
            .offset(x: 20, y: -0.5)
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
