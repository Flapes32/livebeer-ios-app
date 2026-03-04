import SwiftUI

struct LitersProgressCard: View {
    // MARK: - Properties

    let currentLiters: Double
    let targetLiters: Double

    // MARK: - Views

    var body: some View {
        ZStack {
            backgroundCard
            contentView
        }
        .frame(height: 132)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Накоплено литров: \(litersValue)")
        .accessibilityHint("Копите литры и получайте пиво бесплатно")
    }

    // MARK: - Background

    private var backgroundCard: some View {
        RoundedRectangle(cornerRadius: AppRadius.lg, style: .continuous)
            .fill(Color.black)
    }

    // MARK: - Content

    private var contentView: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            imagesRow
            textRow
        }
        .padding(AppSpacing.md)
    }

    // MARK: - Images

    private var imagesRow: some View {
        let screenWidth = UIScreen.main.bounds.width
        let availableWidth = screenWidth - AppSpacing.md * 4 // padding с обеих сторон
        let maxStoppersWidth: CGFloat = 230
        let maxBeerWidth: CGFloat = 102
        let stoppersWidth = min(maxStoppersWidth, availableWidth * 0.65)
        let beerWidth = min(maxBeerWidth, availableWidth * 0.3)
        
        return HStack(alignment: .top, spacing: AppSpacing.xs) {
            stoppersGrid(width: stoppersWidth)
            beerImage(width: beerWidth)
        }
    }

    private func stoppersGrid(width: CGFloat) -> some View {
        let stopperSize = min(width / 5 - 4, 45)
        
        return VStack(spacing: 4) {
            HStack(spacing: 4) {
                ForEach(0..<5, id: \.self) { _ in
                    stopperImage(size: stopperSize)
                }
            }
            HStack(spacing: 4) {
                ForEach(0..<5, id: \.self) { _ in
                    stopperImage(size: stopperSize)
                }
            }
        }
        .frame(width: width, height: stopperSize * 2 + 4, alignment: .leading)
    }

    private func stopperImage(size: CGFloat) -> some View {
        Image(Assets.LitersProgress.stopper.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }

    private func beerImage(width: CGFloat) -> some View {
        Image(Assets.LitersProgress.beer.rawValue)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width * 0.93)
    }

    // MARK: - Text

    private var textRow: some View {
        HStack(alignment: .top, spacing: AppSpacing.sm) {
            litersInfoView
            dividerView
            descriptionView
        }
    }

    private var litersInfoView: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xxs) {
            Text(litersValue)
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(AppColors.surface)

            Text("Накоплено литров")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(AppColors.surface)
        }
    }

    private var dividerView: some View {
        Rectangle()
            .fill(AppColors.gray.opacity(0.6))
            .frame(width: 1, height: 50)
            .padding(.top, 12)
    }

    private var descriptionView: some View {
        Text("Копите литры\nи получайте пиво\nбесплатно")
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(AppColors.gray)
            .multilineTextAlignment(.leading)
            .lineSpacing(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, AppSpacing.sm)
            .padding(.top, 10)
    }

    // MARK: - Computed Properties

    private var litersValue: String {
        "\(Int(currentLiters))/\(Int(targetLiters))"
    }
}

#Preview {
    LitersProgressCard(currentLiters: 10, targetLiters: 10)
        .padding()
        .background(AppColors.background)
}

